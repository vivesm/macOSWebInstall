#!/bin/zsh

# Read variables from JAMF Pro policy
appName="$4"
appURL="$5"
appType="${appURL##*.}"

# Create a temporary directory
tmpdir=$(mktemp -d)

# Download Latest '$appName' with progress bar
echo "Downloading and Installing Latest '$appName'..."
case "$appType" in
  "pkg")
    if curl -# -L -o "$tmpdir/$appName.$appType" "$appURL"; then
      if sudo installer -pkg "$tmpdir/$appName.$appType" -target / -quiet; then
        echo "Installation complete."
      else
        echo "Installation failed." >&2
        exit 1
      fi
    else
      echo "Download failed." >&2
      exit 1
    fi
    ;;
  "zip")
    if curl -# -L -o "$tmpdir/$appName.$appType" "$appURL"; then
      if unzip -q "$tmpdir/$appName.$appType" -d "$tmpdir"; then
        if sudo installer -pkg "$tmpdir/$appName.pkg" -target / -quiet; then
          echo "Installation complete."
        else
          echo "Installation failed." >&2
          exit 1
        fi
      else
        echo "Extraction failed." >&2
        exit 1
      fi
    else
      echo "Download failed." >&2
      exit 1
    fi
    ;;
  "dmg")
    if curl -# -L -o "$tmpdir/$appName.$appType" "$appURL"; then
      if hdiutil attach "$tmpdir/$appName.$appType" -quiet; then
        volumePath=$(find /Volumes -maxdepth 1 -type d -name "*$appName*" -print -quit)
        if [ -n "$volumePath" ]; then
          appPath=$(find "$volumePath" -maxdepth 1 -name "*.app" -print -quit)
          if [ -n "$appPath" ]; then
            if sudo cp -R "$appPath" /Applications; then
              echo "Installation complete."
            else
              echo "Installation failed." >&2
              exit 1
            fi
          else
            echo "Application not found in DMG." >&2
            exit 1
          fi
        else
          echo "DMG not mounted." >&2
          exit 1
        fi
        hdiutil detach "$volumePath" -quiet
      else
        echo "Mounting DMG failed." >&2
        exit 1
      fi
    else
      echo "Download failed." >&2
      exit 1
    fi
    ;;
  *)
    echo "Unsupported file type: $appType" >&2
    exit 1
    ;;
esac

# Clean up
echo "Cleaning up..."
rm -fr "$tmpdir"

exit 0
