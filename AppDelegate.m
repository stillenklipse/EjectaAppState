
#import "AppDelegate.h"
#import "EJJavaScriptView.h"
@implementation AppDelegate
@synthesize window;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
	// Optionally set the idle timer disabled, this prevents the device from sleep when
	// not being interacted with by touch. ie. games with motion control.
	application.idleTimerDisabled = YES;
	
	[self loadViewControllerWithScriptAtPath:@"index.js"];
	activeStatus = NO;
    return YES;
}

- (void)loadViewControllerWithScriptAtPath:(NSString *)path {
	// Release any previous ViewController
	window.rootViewController = nil;
	
	EJAppViewController *vc = [[EJAppViewController alloc] initWithScriptAtPath:path];
	window.rootViewController = vc;
	[window makeKeyWindow];
	[vc release];
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
    activeStatus = YES;
}

-(BOOL)getActiveStatus{
    return activeStatus;
}
-(void)resetActiveStatus{
    activeStatus = NO;
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	window.rootViewController = nil;
	[window release];
    [super dealloc];
}


@end
