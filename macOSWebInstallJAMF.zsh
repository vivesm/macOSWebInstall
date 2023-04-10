#!/bin/zsh

# Read variables from JAMF Pro policy
appName="$4"
appURL="$5"

# Create a temporary directory
tmpdir=$(mktemp -d)

# Download Latest '$appName' with progress bar
echo "Downloading and Installing Latest '$appName'..."
if curl -# -L -o "$tmpdir/$appName.pkg" "$appURL"; then
  # Uncomment the following lines to prompt the user for confirmation
  # read -p "Do you want to install '$appName'? [y/N] " confirm
  # if [[ "$confirm" =~ ^[Yy]$ ]]; then
    if sudo installer -pkg "$tmpdir/$appName.pkg" -target / -quiet; then
      echo "Installation complete."
    else
      echo "Installation failed." >&2
      exit 1
    fi
  # else
  #   echo "Installation canceled by user."
  # fi
else
  echo "Download failed." >&2
  exit 1
fi

# Clean up
echo "Cleaning up..."
rm -fr "$tmpdir"

exit 0
