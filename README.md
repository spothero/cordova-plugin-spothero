# cordova-plugin-spothero
This ionic/cordova plugin will include SpotHero Partner SDK (https://github.com/spothero/iOS-Partner-SDK) dependencies and a simple initialization API.

*Note*: Due to the cocoapods dependencies, after adding this plugin be sure to open the .xcworkspace in XCode instead of the .xcodeproj.

## Getting Started

### Installation
Navigate to your project directory and using the latest [Cordova CLI](http://cordova.apache.org/):
```
cordova plugin add [your-local-path]/cordova-plugin-spothero
```

or

```
ionic plugin add [your-local-path]/cordova-plugin-spothero
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
    partnerApplicationName: 'Application Name', # Application name (optional)
    tintColor: 'rgb(0, 0, 0)', # Tint color in rgb string format (optional)
    textColor: 'rgb(255, 255, 255)', # Text color in rgb string format (optional)
    success: successCallback, # SDK launch success callback (optional)
    error: errorCallback # SDK launch error callback (optional)
});
```

### Building

Build your project from the [Ionic CLI](http://ionicframework.com/getting-started/) first to fetch plugin dependencies.
```
ionic build ios
```

Now open your project `.xcworkspace` file and build in Xcode 8.  This is typically located at the follow location...
```
your-project/platforms/ios/yourProject.xcworkspace
```

## More Info

For more information on setting up Cordova see [the documentation](http://cordova.apache.org/docs/en/latest/guide/cli/index.html)

For more info on plugins see the [Plugin Development Guide](http://cordova.apache.org/docs/en/latest/guide/hybrid/plugins/index.html)
