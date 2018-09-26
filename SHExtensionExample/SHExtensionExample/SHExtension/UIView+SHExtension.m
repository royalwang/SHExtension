//
//  UIView+SHExtension.m
//  SHExtension
//
//  Created by CSH on 2018/9/19.
//  Copyright © 2018年 CSH. All rights reserved.
//

#import "UIView+SHExtension.h"

@implementation UIView (SHExtension)

#pragma mark - frame
- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setMaxX:(CGFloat)maxX {
    
}

- (CGFloat)maxX {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setMaxY:(CGFloat)maxY {
    
}

- (CGFloat)maxY {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY {
    return self.center.y;
}


- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin.x = origin.x;
    frame.origin.y = origin.y;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

#pragma mark - 描边
- (void)borderRadius:(CGFloat)radius width:(CGFloat)width color:(UIColor *)color{
    
    [self.layer setBorderWidth:(width)];
    [self.layer setCornerRadius:(radius)];
    [self.layer setBorderColor:[color CGColor]];
    [self.layer setMasksToBounds:YES];
}

#pragma mark - 获取一个渐变色的视图
+ (UIView *)getGradientViewWithSize:(CGSize)size colorArr:(NSArray *)colorArr{
    
    UIView *view = [[UIView alloc]init];
    view.size = size;
    
    //  CAGradientLayer类对其绘制渐变背景颜色、填充层的形状(包括圆角)
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.bounds;
    //  创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = colorArr;
    
    //  设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
    gradientLayer.startPoint = CGPointMake(0, 0.1);
    gradientLayer.endPoint = CGPointMake(1, 0.9);

    // 设置渐变位置
    CGFloat loc = 1.0/(colorArr.count - 1);
    NSMutableArray *location = [[NSMutableArray alloc]init];
    [location addObject:@0];
    NSInteger index = 1;
    
    while (index != colorArr.count) {
        [location addObject:[NSNumber numberWithFloat:index*loc]];
        index++;
    }

    //设置颜色变化点，取值范围 0.0~1.0
    gradientLayer.locations = location;
    
    [view.layer addSublayer:gradientLayer];
    
    return view;
}

#pragma mark - xib 属性
#pragma mark 设置边框宽度
- (void)setBorderWidth:(CGFloat)borderWidth {
    
    if (borderWidth < 0) return;
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth{
    return self.borderWidth;
}

#pragma mark 设置边框颜色
- (void)setBorderColor:(UIColor *)borderColor {
    
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor{
    return self.borderColor;
}

#pragma mark 设置圆角
- (void)setCornerRadius:(CGFloat)cornerRadius {
    
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}

- (CGFloat)cornerRadius{
    return self.cornerRadius;
}



@end
