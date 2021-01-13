//
//  GTListItem.h
//  UITableView
// 
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 列表结构化数据处理
@interface GTListItem : NSObject<NSSecureCoding>


- (nullable instancetype)initWithCoder:(NSCoder *)coder; // NS_DESIGNATED_INITIALIZER
- (void)encodeWithCoder:(NSCoder *)coder;

@property (nonatomic, strong, readwrite) NSString *category;
@property (nonatomic, strong, readwrite) NSString *picUrl;
@property (nonatomic, strong, readwrite) NSString *uniqueKey;
@property (nonatomic, strong, readwrite) NSString *title;
@property (nonatomic, strong, readwrite) NSString *date;
@property (nonatomic, strong, readwrite) NSString *authorName;
@property (nonatomic, strong, readwrite) NSString *articleUrl;

- (void)configWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
