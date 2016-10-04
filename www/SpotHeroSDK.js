var exec = require('cordova/exec');

exports.init = function(options) {
    if (!options.partnerApplicationKey) {
        console.log('SpotHeroSDK error: partnerApplicationKey is required.');
        return;
    }

    exec(options.success, options.error, 'SpotHeroSDK', 'startup', [
        options.partnerApplicationKey,
        options.tintColor,
        options.textColor
    ]);
};
