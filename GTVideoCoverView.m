//
//  GTVideoCoverView.m
//  UITableView
// 
//

#import "GTVideoCoverView.h"
#import <AVFoundation/AVFoundation.h>
#import "GTVideoPlayer.h"
#import "GTVideoToolbar.h"

@interface GTVideoCoverView()
@property (nonatomic, strong, readwrite) UIImageView *coverView;
@property (nonatomic, strong, readwrite) UIImageView *PlayButton;
@property (nonatomic, copy, readwrite) NSString *videoUrl;
@property (nonatomic, strong, readwrite) GTVideoToolbar *toolbar;
@end

@implementation GTVideoCoverView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - GTVideoToolbarHeight)];
            _coverView;
        })];
        [_coverView addSubview:({
            _PlayButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50)/2, (frame.size.height - 50 - GTVideoToolbarHeight)/2, 50, 50)];
            _PlayButton.image = [UIImage imageNamed:@"start"];
            _PlayButton;
        })];
        
        [self addSubview:({
            _toolbar = [[GTVideoToolbar alloc] initWithFrame:CGRectMake(0, _coverView.bounds.size.height, frame.size.width, GTVideoToolbarHeight)];
            _toolbar;
        })];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self  addGestureRecognizer:tapGesture];
    }
    return self;
} 

#pragma mark - public method

- (void)layoutWithVedioCoverUrl:(NSString *)videCoveroUrl videoUrl:(NSString *)videoUrl {
    _coverView.image = [UIImage imageNamed:videCoveroUrl];
    _videoUrl = videoUrl;
    [_toolbar layoutWithModel:nil];
}
#pragma mark - private
- (void)_tapToPlay {
    [[GTVideoPlayer Player] playVideoWithUrl:_videoUrl attachView:_coverView];
}

@end
