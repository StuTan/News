//
//  GTLogin.h
//  UITableView
// 
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTLogin : NSObject

@property (nonatomic, strong, readwrite) NSString *nick;
@property (nonatomic, strong, readwrite) NSString *address;
@property (nonatomic, strong, readwrite) NSString *avatorUrl;

+ (instancetype)sharedLogin;

#pragma mark - 登录
- (BOOL)isLogin;
- (void)logOut;
- (void)logIn;

@end

NS_ASSUME_NONNULL_END
