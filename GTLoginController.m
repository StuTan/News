//
//  GTLoginController.m
//  UITableView
//
//  Created by tanwenmeng on 2021/1/12.
//

#import "GTLoginController.h"
#import "Masonry.h"
#import "HLAlertViewBlock.h"
#import "GTSignController.h"

@interface GTLoginController ()
@property (nonatomic, strong, readwrite) UILabel *accountLabel;
@property (nonatomic, strong, readwrite) UILabel *passwordLabel;
@property (nonatomic, strong, readwrite) UITextView *accounTextView;
@property (nonatomic, strong, readwrite) UITextView *passwordTextView;
@property (nonatomic, strong, readwrite) UIButton *loginButton;
@end

@implementation GTLoginController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.navigationItem.title = @"登录";
        self.view.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.accountLabel];
    [self.view addSubview:self.passwordLabel];
    [self.view addSubview:self.accounTextView];
    [self.view addSubview:self.passwordTextView];
    [self.view addSubview:self.loginButton];
    [self makeConstraints];
}

- (void)makeConstraints {
    [self.accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view.mas_top).offset(300);
            make.left.mas_equalTo(self.view.mas_left).offset(50);
            make.height.mas_equalTo(50.0);
        }];
         
    [self.accounTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(300);
        make.left.mas_equalTo(self.accountLabel.mas_right).offset(5);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.height.mas_equalTo(40.0);
    }];
    
    [self.passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.accountLabel.mas_bottom).offset(40);
        make.left.mas_equalTo(self.view.mas_left).offset(50);
        make.height.mas_equalTo(50.0);
    }];
         
    [self.passwordTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.accountLabel.mas_bottom).offset(40);
        make.left.mas_equalTo(self.passwordLabel.mas_right).offset(5);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.height.mas_equalTo(40.0);
    }];
     
}

#pragma mark - getter
- (UITextView *)accounTextView {
    if(!_accounTextView) {
        _accounTextView = [[UITextView alloc] init];
        _accounTextView.font = [UIFont systemFontOfSize:15];
        _accounTextView.backgroundColor = [UIColor whiteColor];
    }
    return _accounTextView;
}

- (UITextView *)passwordTextView {
    if(!_passwordTextView) {
        _passwordTextView = [[UITextView alloc] init];
        _passwordTextView.font = [UIFont systemFontOfSize:15];
        _passwordTextView.backgroundColor = [UIColor whiteColor];
    }
    return _passwordTextView;
}

- (UILabel *)accountLabel {
    if(!_accountLabel) {
        _accountLabel = [[UILabel alloc] init];
        _accountLabel.textColor = [UIColor blackColor];
        _accountLabel.font = [UIFont systemFontOfSize:16];
        _accountLabel.text = @"账号：";
    }
    return _accountLabel;
}

- (UILabel *)passwordLabel {
    if(!_passwordLabel) {
        _passwordLabel = [[UILabel alloc] init];
        _passwordLabel.textColor = [UIColor blackColor];
        _passwordLabel.font = [UIFont systemFontOfSize:16];
        _passwordLabel.text = @"密码：";
    }
    return _passwordLabel;
}

- (UIButton *)loginButton {
    if(!_loginButton) {
        _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 500, 300, 50)];
        _loginButton.layer.cornerRadius = 5;
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(GTLogin) forControlEvents:UIControlEventTouchUpInside];
        [_loginButton setBackgroundColor:[UIColor blueColor]];
    }
    return _loginButton;
}

- (void)GTLogin {
    
    NSString *account = self.accounTextView.text;
    NSString *password = self.passwordTextView.text;
    NSArray *userAccountArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"userAccoount"];
    NSArray *userPasswordArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"userPassword"];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    NSInteger index = [userAccountArray indexOfObject:account];
    if (index > 0) {
        //包含当前账户，跳转到登录界面
        if(password == [userPasswordArray objectAtIndex:index]) {
            //当前用户密码正确,正常登录
            [self.navigationController popToRootViewControllerAnimated:YES];
        } else {
            //当前用户密码错误
            HLAlertViewBlock * alertView = [[HLAlertViewBlock alloc] initWithTittle:@"提示" message:@"密码错误" block:^(NSInteger index) {
            }];
            [alertView show];
        }
    } else {
        HLAlertViewBlock * alertView = [[HLAlertViewBlock alloc] initWithTittle:@"提示" message:@"当前用户不存在，请前往注册" block:^(NSInteger index) {
        }];
        [alertView show];
        GTSignController *signController = [[GTSignController alloc] init];
        [self.navigationController pushViewController:signController animated:NO];
    }
}

#pragma mark --- block回调弹窗

- (void)alertViewWithBlock{
    HLAlertViewBlock * alertView = [[HLAlertViewBlock alloc] initWithTittle:@"提示" message:@"通过Block弹窗回调的弹窗" block:^(NSInteger index) {
        
    }];
    [alertView show];
}

#pragma mark --- 弹窗点击事件
- (void)alertSureButtonClick{
    NSLog(@"点击了确认按钮");
}

- (void)alertCauseButtonClick{
    NSLog(@"点击了取消按钮");
}
@end
