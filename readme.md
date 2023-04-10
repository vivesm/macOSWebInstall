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

This script is licensed under the [MIT License](https://opensource.org/licenses/MIT).

MIT License

Copyright (c) 2023 Melvin Vives

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

If you find any issues or have suggestions for improvement, please submit an issue or pull request.
