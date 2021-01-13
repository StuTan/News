//
//  GTMineViewController.m
//  UITableView
// 
//

#import "GTMineViewController.h"
#import "GTLogin.h"
#import "GTLoginController.h"
 
@interface GTMineViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong, readwrite) UIView *tableViewHeaderView;
@property (nonatomic, strong, readwrite) UIImageView *headerImageView;
@end

@implementation GTMineViewController

- (instancetype)init {
    self = [super init];
    if(self) {
        self.tabBarItem.title = @"我的";
//        self.tabBarItem.image = [UIImage imageNamed:@"avator"];
//        self.tabBarItem.selectedImage = [UIImage imageNamed:@"avator"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:({
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView;
    })];
}

#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
 
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mineTableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mineTableViewCell"];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (nullable UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if(!_tableViewHeaderView) {
        _tableViewHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _tableViewHeaderView.backgroundColor = [UIColor whiteColor];
        
        [_tableViewHeaderView addSubview:({
            _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(145, 50, 100, 100)];
            _headerImageView.backgroundColor = [UIColor whiteColor];
            _headerImageView.contentMode = UIViewContentModeScaleAspectFit;
            _headerImageView;
        })];
        
        [_tableViewHeaderView addGestureRecognizer:({
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(logOrLogout)];
            tapGesture;
        })];
    }
    return _tableViewHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 200;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if(![[GTLogin sharedLogin] isLogin]) {
        [_headerImageView setImage:[UIImage imageNamed:@"avator"]];
    } else {
        [_headerImageView setImage:[UIImage imageNamed:@"avator"]];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        cell.textLabel.text = @"昵称： 油醋三椒";
    } else {
        cell.textLabel.text = @"地址： 朝阳区";
    }
}
 
- (void)logOrLogout {
    GTLoginController *loginController = [[GTLoginController alloc] init];
    [self.navigationController pushViewController:loginController animated:NO];
    if ([[GTLogin sharedLogin] isLogin]) {
        [[GTLogin sharedLogin] logOut];
    } else {
        [[GTLogin sharedLogin] logIn];
    }
}

@end
