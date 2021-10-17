//
//  Manager.m
//  JSONModelDemo
//
//  Created by 差不多先生 on 2021/10/14.
//

#import "Manager.h"
static Manager* manager = nil;
@implementation Manager
+(instancetype)shareManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [Manager new];
        });
    }
    return manager;
}
- (void)NetworkQuestSuccess:(GetJSONBlock)GetJSONBlock error:(ErrorBlock)ErrorBlock {
    NSString* URLString = @"https://news-at.zhihu.com/api/4/news/latest";
    // 处理中文
    URLString = [URLString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    // 创建一个网络请求
    NSURL* textUrl = [NSURL URLWithString:URLString];
    NSURLRequest* textRequest = [NSURLRequest requestWithURL:textUrl];
    // 创建网络请求会话
    NSURLSession* textSession = [NSURLSession sharedSession];
    // 创建一个请求任务
    NSURLSessionDataTask* textDataTask = [textSession dataTaskWithRequest:textRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            TextModel* ansModel = [[TextModel alloc] initWithData:data error:nil];
            GetJSONBlock(ansModel);
        } else {
            ErrorBlock(error);
        }
    }];
    // 任务启动
    [textDataTask resume];
}
@end
