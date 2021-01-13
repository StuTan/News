//
//  GTListLoder.m
//  UITableView
// 
//

#import "GTListLoder.h"
#import "GTListItem.h"
#import <AFNetworking.h>

typedef void(^GTListLoderFinishBlock)(BOOL success, NSArray<GTListItem *> *dataArray);

@implementation GTListLoder

- (void)loadListDataWithFinishBlock:(GTListLoderFinishBlock)finishBlock {
    
    NSArray<GTListItem *> *listData = [self _readDataFromLocal];
    if(listData) {
        finishBlock(YES, listData);
    }
    
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    NSURL *listURL = [NSURL URLWithString:urlString];
    
    __unused NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    __weak typeof(self)wself = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        __strong typeof(wself)strongSelf = wself;
        NSError *jsonError;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        #warning 类型检查（判断取出的如果不是字典，则报一个错误）
        NSArray *dataArray = [((NSDictionary *)[((NSDictionary *)jsonObject) objectForKey:@"result"]) objectForKey:@"data"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        for(NSDictionary *info in dataArray) {
            GTListItem *listItem = [[GTListItem alloc] init];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
        }
        [self _archiveListDataWithArray:listItemArray.copy];
        // 回调在主线程中
        dispatch_async(dispatch_get_main_queue(), ^{
            if(finishBlock) {
                finishBlock(error == nil,listItemArray.copy);
            }
        });
        NSLog(@""); //对数据的处理逻辑
        
    }];
    
    [dataTask resume];
}

- (NSArray<GTListItem *> *)_readDataFromLocal {
    
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSString *listDataPath = [cachePath stringByAppendingPathComponent:@"GTData/list"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //反序列化 -- 读出时
    NSData *reloadData = [fileManager contentsAtPath:listDataPath];
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:reloadData error:nil];
    if([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0) {
        return (NSArray<GTListItem *> *)unarchiveObj;
    }
    return nil;
    
}

- (void)_archiveListDataWithArray:(NSArray<GTListItem *> *)array {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // cache的目录下创建一个文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    NSError *creatError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&creatError];
    //创建文件
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    
    //序列化 -- 写入时
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    NSData *data = [@"abc" dataUsingEncoding:NSUTF8StringEncoding];
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    //反序列化 -- 读出时
    NSData *reloadData = [fileManager contentsAtPath:listDataPath];
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:reloadData error:nil];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"abc" forKey:@"test"];
    
    NSString *test = [[NSUserDefaults standardUserDefaults] stringForKey:@"test"];
  
    
}

@end
