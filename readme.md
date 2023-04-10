# Script for Downloading and Installing Packages

This script is designed for use with JAMF Pro to download and install packages from the web. The script supports three types of packages: `.pkg`, `.zip`, and `.dmg`.

## Usage

1. Create a new policy in JAMF Pro.
2. Configure the policy to run a script.
3. Upload the script file (`download-and-install.sh`) to the policy.
4. In the policy configuration, set the following variables:
   - `Parameter 4`: The name of the package to install.
   - `Parameter 5`: The URL of the package to download.
5. Save and test the policy.

## Supported File Types

- `.pkg`: The script uses `installer` to install the package directly.
- `.zip`: The script downloads the file, extracts it to a temporary directory, and then installs the resulting `.pkg` file using `installer`.
- `.dmg`: The script downloads the file, mounts it, finds the application in the mounted DMG, and copies it to the `/Applications` directory.

## License

This script is licensed under the [MIT License](https://opensource.org/licenses/MIT). Feel free to modify and distribute the script as needed. If you find any issues or have suggestions for improvement, please submit an issue or pull request.
