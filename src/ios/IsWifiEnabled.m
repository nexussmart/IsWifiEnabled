#import "IsWifiEnabled.h"
#import <Cordova/CDV.h>

@implementation IsWifiEnabled

- (void)check:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    struct ifaddrs 	*interfaces;
    int		count = 0;

    if (!getifaddrs(&interfaces)) {
        for (struct ifaddrs *interface = interfaces; interface; interface=interface->ifa_next) {
            BOOL up = (interface->ifa_flags & IFF_UP) == IFF_UP;
            if (up) {
                if (strcmp(interface->ifa_name, "awdl0") == 0)
                    count += 1;
		        if (count >= 2)
		    	    break;
            }
        }
    }
    free(interfaces);
	if (count >= 2)
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK]; // Wifi is enabled and probably connected
	else
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Wifi is not enabled."]; // Wifi not enabled and not connected
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end