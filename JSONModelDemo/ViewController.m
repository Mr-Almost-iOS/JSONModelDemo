//
//  ViewController.m
//  JSONModelDemo
//
//  Created by 差不多先生 on 2021/10/11.
//

#import "ViewController.h"
#import "TextModel.h"
#import "Manager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self text];
    
}
-(void)text{
    [[Manager shareManager] NetworkQuestSuccess:^(TextModel * _Nonnull mainViewNowModel) {
        NSLog(@"%@",mainViewNowModel.stories[0]);
            NSLog(@"请求成功");
        } error:^(NSError * _Nonnull error) {
            NSLog(@"请求失败");
        }];
}
@end
