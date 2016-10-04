# cordova-plugin-spothero
This ionic/cordova plugin will install SpotHero Partner SDK (https://github.com/spothero/iOS-Partner-SDK) dependencies and provide a JavaScript API.

## Getting Started

### Requirements
- Cordova >= 6.2.x
- Xcode >= 8
- iOS Target >= 9.0

### Installation
Navigate to your project directory and using the latest [Cordova CLI](http://cordova.apache.org/):

```
cordova plugin add https://github.com/spothero/cordova-plugin-spothero
```

### Project Configuration

Add the following preferences to your ios platform configuration within your project's root `config.xml`
```xml
...
<platform name="ios">
    <preference name="pods_ios_min_version" value="9.0"/>
    <preference name="pods_use_frameworks" value="true"/>
    ...
```

Add the following npm dependencies within the project's root `package.json`
```js
"dependencies": {
    ...
    "command-exists": "^1.0.2",
    "lodash": "^4.16.2",
    "xml2js": "^0.4.17"
 }
```

Run `npm install` to install the new npm dependencies.

### Usage

At a minimum the SpotHeroSDK requires a `PARTNER_API_KEY` to launch.
```js
if (window.cordova && window.cordova.plugins.SpotHeroSDK) {
    window.cordova.plugins.SpotHeroSDK.init({
        partnerApplicationKey: 'PARTNER_API_KEY'
    });
}
```

Additional options...
```js
window.cordova.plugins.SpotHeroSDK.init({
    partnerApplicationKey: 'PARTNER_API_KEY', # Partner API key (required)
    tintColor: '#1459ff', # Tint color in hex string format (optional)
    textColor: '#ffffff', # Text color in hex string format (optional)
    success: successCallback, # SDK launch success callback (optional)
    error: errorCallback # SDK launch error callback (optional)
});
```

### Building

Build your Ionic/Cordova project first to fetch plugin dependencies (with  [Ionic CLI](http://ionicframework.com/getting-started/))...
```
ionic build ios
```
or without Ionic...
```
cordova build ios
```

Next open your project `.xcworkspace` file and build in Xcode 8.  This is typically located at `your-project/platforms/ios/yourProject.xcworkspace`.

## More Info

Due to the cocoapods dependencies, after adding this plugin be sure to open the .xcworkspace in XCode instead of the .xcodeproj.

For more information on setting up Cordova see [the documentation](http://cordova.apache.org/docs/en/latest/guide/cli/index.html)

For more info on plugins see the [Plugin Development Guide](http://cordova.apache.org/docs/en/latest/guide/hybrid/plugins/index.html)
