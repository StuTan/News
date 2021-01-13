//
//  AppDelegate.m
//  UITableView
// 
//

#import "AppDelegate.h"
#import "GTNewsViewController.h"
#import "GTVideoViewController.h"
#import "GTRecommendViewController.h"
#import "GTSplashView.h"
#import "GTMineViewController.h"
@interface AppDelegate ()<UITabBarDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
     
    UITabBarController *tabbarController = [[UITabBarController alloc]init];
    
    GTNewsViewController *newsViewController = [[GTNewsViewController alloc] init];
    GTVideoViewController *videoController = [[GTVideoViewController alloc] init];
    GTRecommendViewController *recommendViewController = [[GTRecommendViewController alloc] init];
    GTMineViewController *mineViewController = [[GTMineViewController alloc] init];
    
    [tabbarController setViewControllers:@[newsViewController, videoController, mineViewController]];
//    [tabbarController setViewControllers:@[newsViewController,videoController,recommendViewController,mineViewController]];
   
    tabbarController.delegate = self;
    
    UINavigationController *navigationcontroller = [[UINavigationController alloc] initWithRootViewController:tabbarController]; //自身没有任何逻辑和视图
    

     
    self.window.rootViewController = navigationcontroller;
    [self.window makeKeyAndVisible];
    
    [self.window addSubview:({
        GTSplashView *splashView = [[GTSplashView alloc] initWithFrame:self.window.bounds];
        splashView;
    })];
    return YES;
}

/// 解析外部应用跳转到本应用内的信息
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return YES;
}


@end
