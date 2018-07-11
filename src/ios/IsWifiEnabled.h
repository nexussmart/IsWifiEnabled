#import <Cordova/CDV.h>

#import <arpa/inet.h>
#import <ifaddrs.h>
#import <net/if.h>

@interface IsWifiEnabled : CDVPlugin

- (void)check:(CDVInvokedUrlCommand*)command;

@end