//
//  HLAlertViewBlock.h
//  HLAlertView
// 
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    AlertBlockCauseButtonClick = 0,
    AlertBlockSureButtonClick
} AlertBlockButtonClickIndex;

@interface HLAlertViewBlock : UIView

@property(nonatomic, copy) void (^buttonBlock) (NSInteger index);

- (instancetype)initWithTittle:(NSString *)tittle message:(NSString *)message block:(void (^) (NSInteger index))block;

- (void)show;

@end
