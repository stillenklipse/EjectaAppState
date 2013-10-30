//
//  EJBindingAppStatus.m
//  Ejecta
//
//  Created by Jeffrey Knoch (RK) (IC) on 10/29/13.
//
//

#import "EJBindingAppStatus.h"
#import "AppDelegate.h"
#define APP [[UIApplication sharedApplication] delegate]
@implementation EJBindingAppStatus


EJ_BIND_GET( shouldPauseGame, ctx ) {
    BOOL appStatus =  [APP performSelector:@selector(getActiveStatus)];
    NSString *status = [NSString stringWithFormat:@"%i",appStatus];
    JSValueRef appStatusValue = NSStringToJSValue( ctx, status );
    return appStatusValue;
}

EJ_BIND_FUNCTION( resetGameStatusFlag, ctx, argc, argv ){
    [APP performSelector:@selector(getActiveStatus)];
    return NULL;
}


@end
