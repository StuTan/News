//
//  GTLogin.m
//  UITableView
// 
//

#import "GTLogin.h"
#import "GTLoginController.h"
  
@interface GTLogin ()
@property (nonatomic, assign, readwrite) BOOL isLogin;
@end
 
@implementation GTLogin

+ (instancetype)sharedLogin {
    static GTLogin *login;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        login = [[GTLogin alloc] init];
    });
    return login;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _isLogin = NO;
    }
    return self;
}

- (BOOL)isLogin {
    //登录失效的逻辑
    return _isLogin;
}
 
- (void)logOut {
    _isLogin = NO;
}

- (void)logIn {
    _isLogin = YES;
    
}

@end
