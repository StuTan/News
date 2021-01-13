//
//  GTListItem.m
//  UITableView
// 
//

#import "GTListItem.h"

@implementation GTListItem

# pragma mark - NSSecureCoding
- (void)configWithDictionary:(NSDictionary *)dictionary {
    self.category = [dictionary objectForKey:@"category"];
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
    self.uniqueKey = [dictionary objectForKey:@"uniquekey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.authorName = [dictionary objectForKey:@"author_name"];
    self.articleUrl = [dictionary objectForKey:@"url"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDeCoder {
    self = [super init];
    if(self) {
        self.category = [aDeCoder decodeObjectForKey:@"category"];
        self.picUrl = [aDeCoder decodeObjectForKey:@"thumbnail_pic_s"];
        self.uniqueKey = [aDeCoder decodeObjectForKey:@"uniquekey"];
        self.title = [aDeCoder decodeObjectForKey:@"title"];
        self.date = [aDeCoder decodeObjectForKey:@"date"];
        self.authorName = [aDeCoder decodeObjectForKey:@"author_name"];
        self.articleUrl = [aDeCoder decodeObjectForKey:@"url"];
    }
    return self;
}

# pragma mark  - NSSecureCoding

+ (BOOL)supportsSecureCoding {
    return YES;
}

# pragma mark - init

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.category forKey:@"category"];
    [aCoder encodeObject:self.picUrl forKey:@"thumbnail_pic_s"];
    [aCoder encodeObject:self.uniqueKey forKey:@"uniquekey"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.date forKey:@"date"];
    [aCoder encodeObject:self.authorName forKey:@"author_name"];
    [aCoder encodeObject:self.articleUrl forKey:@"url"];
}


@end
