//
//  ViewController.m
//  SHExtensionExample
//
//  Created by CSH on 2018/9/20.
//  Copyright © 2018年 CSH. All rights reserved.
//

#import "ViewController.h"
#import "NSString+SHExtension.h"
#import "UIColor+SHExtension.h"
#import "UIView+SHExtension.h"
#import "UIImage+SHExtension.h"
#import "SHTool.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[UIImage imageNamed:@"2"] getImageColorWithBlock:^(NSString *colorString) {
        if (colorString) {
            self.view.backgroundColor = [UIColor colorWithHexString:colorString];
        }
    }];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //纯数字

    //处理数据
    [SHTool handleTextField:textField shouldChangeCharactersInRange:range replacementString:string rule:@[@3,@4,@4]];
    //设置光标位置
    return NO;
}

@end
