//
//  WCScrollLabelView.h
//  WCScrollLabelViewDemo
//
//  Created by 乔伟成 on 2017/4/19.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WCScrollLabelView;
@protocol scrollLabelViewDelegate <NSObject>

- (void)scrollLabelView:(WCScrollLabelView *)scrollLabelView didClickAtIndex:(NSInteger)index;

@end

@interface WCScrollLabelView : UIView
/**
 代理
 */
@property (nonatomic, weak) id<scrollLabelViewDelegate> delegate;
/**
 标题数组
 */
@property (nonatomic, strong) NSArray *titleArray;
/**
 标题字体大小
 */
@property (nonatomic, strong) UIFont *titleFont;
/**
 标题颜色
 */
@property (nonatomic, strong) UIColor *titleColor;
/**
 文字对齐
 */
@property (nonatomic, assign) NSTextAlignment textAligment;
/**
 内边距
 */
@property (nonatomic, assign) UIEdgeInsets contentInsets;
/**
 停留时间 默认2s
 */
@property (nonatomic, assign) CGFloat stayInterval;
/**
 滚动动画持续时间 默认0.5s
 */
@property (nonatomic, assign) NSTimeInterval animationDuration;
/// 开始滚动
- (void)beginScrolling;

@end
