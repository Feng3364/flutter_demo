#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

@interface AppDelegate()
@property (nonatomic, strong) FlutterMethodChannel *methodChannel;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
    
    FlutterViewController *vc = (FlutterViewController *)self.window.rootViewController;
    self.methodChannel = [FlutterMethodChannel methodChannelWithName:@"mine_page" binaryMessenger:vc];
    
    UIImagePickerController *imageVC = [[UIImagePickerController alloc] init];
    imageVC.delegate = self;
    [self.methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"picture"]) {
            [vc presentViewController:imageVC animated:true completion:nil];
        }
    }];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    [picker dismissViewControllerAnimated:true completion:^{
        NSString *imagePath = [NSString stringWithFormat:@"%@", info[@"UIImagePickerControllerImageURL"]];
        [self.methodChannel invokeMethod:@"imagePath" arguments:imagePath];
    }];
}

@end
