//
//  WCScrollLabelView.m
//  WCScrollLabelViewDemo
//
//  Created by 乔伟成 on 2017/4/19.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

#import "WCScrollLabelView.h"
@interface WCScrollLabelView ()
/**
 容器view
 */
@property (nonatomic, strong) UIView *container;
/**
 正在显示的label
 */
@property (nonatomic, strong) UILabel *currentLabel;
/**
 下一个要显示的label
 */
@property (nonatomic, strong) UILabel *willShowLabel;
/**
 计时器
 */
@property (nonatomic, strong) NSTimer *timer;
/**
 当前显示的title下标
 */
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation WCScrollLabelView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    _currentIndex = 0;
    _stayInterval = 2;
    _animationDuration = 0.5;
    _contentInsets = UIEdgeInsetsMake(0, 5, 0, 5);
    [self addSubview:self.container];
    [self.container addSubview:self.currentLabel];
    [self.container addSubview:self.willShowLabel];
    [self setTapGesture];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.container.frame = CGRectMake(_contentInsets.left,
                                      _contentInsets.top,
                                      CGRectGetWidth(self.frame) - _contentInsets.left - _contentInsets.right,
                                      CGRectGetHeight(self.frame) - _contentInsets.top - _contentInsets.bottom);
    
    self.currentLabel.frame = CGRectMake(0,
                                         0,
                                         CGRectGetWidth(self.container.frame),
                                         CGRectGetHeight(self.container.frame));
    self.willShowLabel.frame = CGRectMake(0,
                                          CGRectGetHeight(self.container.frame),
                                          CGRectGetWidth(self.container.frame),
                                          CGRectGetHeight(self.container.frame));
}

- (void)beginScrolling
{
    if (self.titleArray.count<2) {
        if (self.titleArray.count) {
            self.currentLabel.text = [self.titleArray firstObject];
        }
        return;
    }
    
    _currentIndex = 0;
    [self creatTimer];
}
- (void)creatTimer
{
    if (nil == _timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:self.stayInterval target:self selector:@selector(startTimer) userInfo:nil repeats:YES];
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    
    
}
- (void)startTimer
{
    [UIView animateWithDuration:0.5 animations:^{
        _currentLabel.frame = CGRectMake(0,
                                         -CGRectGetHeight(self.container.frame),
                                         CGRectGetWidth(_currentLabel.frame),
                                         CGRectGetHeight(_currentLabel.frame));
        _willShowLabel.frame = CGRectMake(0,
                                          0,
                                          CGRectGetWidth(_willShowLabel.frame),
                                          CGRectGetHeight(_willShowLabel.frame));
    } completion:^(BOOL finished) {
        _currentLabel.frame = CGRectMake(0,
                                         CGRectGetHeight(self.container.frame),
                                         CGRectGetWidth(_currentLabel.frame),
                                         CGRectGetHeight(_currentLabel.frame));
        UILabel *label = _willShowLabel;
        _willShowLabel = _currentLabel;
        _currentLabel = label;
        _currentIndex++;
        if (_currentIndex == (self.titleArray.count-1)) {
            _currentLabel.text = self.titleArray[_currentIndex];
            _willShowLabel.text = self.titleArray[0];
        }else{
            if (_currentIndex == self.titleArray.count) {
                _currentIndex = 0;
            }
            _currentLabel.text = self.titleArray[_currentIndex];
            _willShowLabel.text = self.titleArray[_currentIndex+1];
        }
    }];
}
- (void)setTapGesture
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap)];
    [self addGestureRecognizer:tap];
}
- (void)didTap
{
    if (_delegate && [_delegate respondsToSelector:@selector(scrollLabelView:didClickAtIndex:)]) {
        [self.delegate scrollLabelView:self didClickAtIndex:_currentIndex];
    }
}

//MARK: - setter
- (void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;
    if (titleArray&&titleArray.count) {
        _currentLabel.text = [titleArray firstObject];
        if (titleArray.count>1) {
            _willShowLabel.text = titleArray[1];
        }
    }
}
- (void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    self.currentLabel.font = titleFont;
    self.willShowLabel.font = titleFont;
}
- (void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    self.currentLabel.textColor = titleColor;
    self.willShowLabel.textColor = titleColor;
}
- (void)setTextAligment:(NSTextAlignment)textAligment
{
    _textAligment = textAligment;
    self.currentLabel.textAlignment = textAligment;
    self.willShowLabel.textAlignment = textAligment;
}
- (void)setContentInsets:(UIEdgeInsets)contentInsets{
    _contentInsets = contentInsets;
}
//MARK: - getter
- (UIView *)container{
    if (!_container) {
        UIView *cont = [UIView new];
        cont.clipsToBounds = YES;
        _container = cont;
    }
    return _container;
}
- (UILabel *)currentLabel{
    if (!_currentLabel) {
        UILabel *label = [[UILabel alloc] init];
        _currentLabel = label;
    }
    return _currentLabel;
}
- (UILabel *)willShowLabel{
    if (!_willShowLabel) {
        UILabel *label = [[UILabel alloc] init];
        _willShowLabel = label;
    }
    return _willShowLabel;
}

- (void)dealloc
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

@end
