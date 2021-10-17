//
//  TextModel.m
//  JSONModelDemo
//
//  Created by 差不多先生 on 2021/10/11.
//

#import "TextModel.h"

@implementation Top_StoriesModel
// 重写此方法可以避免服务器的数据没有返回nil而崩溃
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation StoriesModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation TextModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end
