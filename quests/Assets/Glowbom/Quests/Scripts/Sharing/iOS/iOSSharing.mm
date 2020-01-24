#import "UnityAppController.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern UIViewController *UnityGetGLViewController();

@interface iOSSharing : NSObject

@end

@implementation iOSSharing

+(void)shareView:(NSString *)message addUrl:(NSString *)url
{
    NSURL *postUrl = [NSURL URLWithString:url];
    NSArray *postItems=@[message,postUrl];
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:postItems applicationActivities:nil];
    
    //if iPhone
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [UnityGetGLViewController() presentViewController:controller animated:YES completion:nil];
    }
    //if iPad
    else {
        UIPopoverPresentationController *popOver = controller.popoverPresentationController;
        if(popOver){
            popOver.sourceView = controller.view;
            popOver.sourceRect = CGRectMake(UnityGetGLViewController().view.frame.size.width/2, UnityGetGLViewController().view.frame.size.height/4, 0, 0);
            [UnityGetGLViewController() presentViewController:controller animated:YES completion:nil];
        }
    }
}

@end

extern "C"
{
    void _ShareMessage(const char *message, const char *url)
    {
        [iOSSharing shareView:[NSString stringWithUTF8String:message] addUrl:[NSString stringWithUTF8String:url]];
    }
}
