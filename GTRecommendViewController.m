//
//  GTRecommendViewController.m
//  UITableView
// 
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@end

@implementation GTRecommendViewController

-(instancetype) init{
    self = [super init];
    if(self){
        self.tabBarItem.title = @"推荐";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
     
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    scrollView.delegate = self;
    
    NSArray *colorArray = @[[UIColor redColor],[UIColor yellowColor],[UIColor blueColor],[UIColor lightGrayColor],[UIColor grayColor]];
    
    for(int i = 0; i < 5; i++){
        [scrollView addSubview:({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width * i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
            
            [view addSubview:({
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
                view.backgroundColor = [UIColor yellowColor];
                UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];                        //定义一个手势
                tapGestureRecognizer.delegate = self;
                [view addGestureRecognizer:tapGestureRecognizer];        //将这个手势绑定在该View上
                view;
            })];
            view.backgroundColor = [colorArray objectAtIndex:i];
            view;
        })];
    }
    scrollView.pagingEnabled = YES;  //是否可以按页滚动
    [self.view addSubview:scrollView];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;             //返回NO的时候不响应，返回YES的时候响应
}
- (void)viewClick{
//
    NSURL *urlScheme = [NSURL URLWithString:@"Weixin://"];
    BOOL canOpenURL = [[UIApplication sharedApplication] openURL:urlScheme];
    [[UIApplication sharedApplication] openURL:urlScheme options:nil completionHandler:^(BOOL success) {
            NSLog(@"viewClick");
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

//开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"BeginDragging");
}
//停止拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"EndDragging");
}
//减速
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"BeginDecelerating");
}
//停止减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"EndDecelerating");
}
 

@end
