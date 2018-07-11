var IsWifiEnabled = {
    check: function(success, failure) {
        cordova.exec(success, failure, "IsWifiEnabled", "check", []);
    }
}

module.exports = IsWifiEnabled;
