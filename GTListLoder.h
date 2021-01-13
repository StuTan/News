//
//  GTListLoder.h
//  UITableView
// 
//

#import <Foundation/Foundation.h>
@class GTListItem;

typedef void(^GTListLoderFinishBlock)(BOOL success, NSArray<GTListItem *> *dataArray);

NS_ASSUME_NONNULL_BEGIN

/// 列表请求
@interface GTListLoder : NSObject

- (void)loadListDataWithFinishBlock:(GTListLoderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
