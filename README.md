#  PythonKit

Swift framework to interact with Python.

## Requirements

`PythonKit` requires recent [Swift 4.2 toolchains](https://swift.org/download/#swift-42-development) and has been tested both on macOS and Linux.

## Build

You can build `PythonKit` with Swift PM. You can configure the Python version to use in the build process with the `PYTHON` environment variable (for example, `PYTHON=2`). The default build will use Python 3.

Then you can build 

```bash
$ cd PythonKit
$ PYTHON=2 swift run
[*] Python 2.7
[ ] Executable: /usr/bin/python
[ ] Version: 2.7.12
$ swift package clean
$ swift run
[*] Python 3.6
[ ] Executable: /usr/bin/python3
[ ] Version: 3.6.3
```

If  the compiler throws any error make sure `pkg-config` is installed as Swift PM uses it to find the Python library and headers. Also, you must set the `PKG_CONFIG_PATH` environment variable with the appropiate paths if `pkg-config` does not find the `python2` and `python3` `.pc` files:

```bash
$ pkg-config --libs python2
Package python was not found in the pkg-config search path.
Perhaps you should add the directory containing `python2.pc'
to the PKG_CONFIG_PATH environment variable
No package 'python2' found
$ pkg-config --libs python3
Package python was not found in the pkg-config search path.
Perhaps you should add the directory containing `python3.pc'
to the PKG_CONFIG_PATH environment variable
No package 'python3' found
$ export PKG_CONFIG_PATH=/Library/Frameworks/Python.framework/Versions/3.7/lib/pkgconfig/:$PKG_CONFIG_PATH
$ export PKG_CONFIG_PATH=/System/Library/Frameworks/Python.framework/Versions/2.7/lib/pkgconfig/:$PKG_CONFIG_PATH
$ pkg-config --libs python3
-L/Library/Frameworks/Python.framework/Versions/3.7/lib -lpython3.7m
$ pkg-config --libs python2
-L/System/Library/Frameworks/Python.framework/Versions/2.7/lib -lpython2.7
```

## Usage

Add the following dependency to your Swift PM `Package.swift` manifest:

```swift
.package(url: "https://github.com/pvieito/PythonKit.git", .branch("master")),
```

## Example

Some Python code like this:

```python
import sys

print(f"Python {sys.version_info.major}.{sys.version_info.minor}")
print(f"Python Executable: {sys.executable}")
print(f"Python Version: {sys.version}")
```

Can be implemented in Swift through PythonKit with the following code:

```swift
import PythonKit

let sys = try Python.import("sys")

print("Python \(sys.version_info.major).\(sys.version_info.minor)")
print("Python Executable: \(sys.executable)")
print("Python Version: \(sys.version)")
```

## Notes

- `PythonGlue.swift` is code from the [Swift for TensorFlow project](https://github.com/tensorflow/swift).
