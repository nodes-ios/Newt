# Newt


[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![Plaform](https://img.shields.io/badge/platform-iOS%20-lightgrey.svg)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/nodes-ios/NStackSDK/blob/master/LICENSE)


*Token management made easy*

## 📝 Requirements

* iOS 10.0+ 
* Swift 5.0+

## 📦 Installation

### Carthage

##### Swift 5
~~~
github "nodes-ios/Newt" ~> 0.1
~~~

## 💻 Usage

### Reading a token

```swift
let newt = Newt(storageType: .userDefaults)
let token = try newt.readToken()
```
 
### Storing a token
```swift
let newt = Newt(storageType: .userDefaults)
try newt.store(token)
```

## 👥 Credits
Made with ❤️ at [Nodes](http://nodesagency.com).

## 📄 License
**Newt** is available under the MIT license. See the [LICENSE](https://github.com/nodes-ios/Newt/blob/master/LICENSE) file for more info.
