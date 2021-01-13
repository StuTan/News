//
//  GTDeleteCellView.h
//  UITableView
// 
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
 
@interface GTDeleteCellView : UIView
 
- (void)showDeleteView:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;

@end

NS_ASSUME_NONNULL_END
