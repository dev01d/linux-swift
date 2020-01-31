### The easy way to install Swift on Ubuntu

These are the steps from [swift.org](https://swift.org/download/#using-downloads) put together in one simple to run script.

I made this because it's not officially in any of the package managers, I'm tired of doing it manually, and all of the other user made solutions are currently broken or don't/won't age well.

This one should age well because:

1. It pulls the version number of the [latest release](https://github.com/apple/swift/releases/latest) tag from the Swift GitHub repo.

2. Downloads the binary from [swift.org](https://swift.org/download/#releases)

3. Installs it.

Also:

4. Puts it in your PATH

5. Cleans up after itself

6. Does the dishes (it won't)

7. Can be used to update Swift versions
