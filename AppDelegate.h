#import <UIKit/UIKit.h>
#import "EJAppViewController.h"

@interface AppDelegate : NSObject <UIApplicationDelegate>{
    bool activeStatus;
}
-(BOOL)getActiveStatus;
-(void)resetActiveStatus;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@end

