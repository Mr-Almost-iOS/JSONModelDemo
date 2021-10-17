//
//  Manager.h
//  JSONModelDemo
//
//  Created by 差不多先生 on 2021/10/14.
//

#import <Foundation/Foundation.h>
#import "TextModel.h"
// 请求到的数据作为参数调用block
typedef void (^GetJSONBlock)(TextModel * _Nonnull mainModel);// 传递接受到的数据
typedef void (^ErrorBlock)(NSError * _Nonnull error);// 请求失败返回error

NS_ASSUME_NONNULL_BEGIN

@interface Manager : NSObject
+(instancetype)shareManager;

-(void)NetworkQuestSuccess:(GetJSONBlock) GetJSONBlock error:(ErrorBlock) errorBlock;

@end

NS_ASSUME_NONNULL_END
