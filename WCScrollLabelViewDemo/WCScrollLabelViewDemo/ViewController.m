//
//  ViewController.m
//  WCScrollLabelViewDemo
//
//  Created by 乔伟成 on 2017/4/19.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

#import "ViewController.h"
#import "WCScrollLabelView.h"
@interface ViewController ()<scrollLabelViewDelegate>
{
    WCScrollLabelView *scrollLabelView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    NSArray *titles = @[@"这是第一条这是第一条这是第一条这是第一条",@"这是第二条",@"这是第三条",@"这是第四条"];
    
    scrollLabelView = [[WCScrollLabelView alloc] initWithFrame:CGRectMake(50, 100, 200, 20)];
    scrollLabelView.backgroundColor = [UIColor whiteColor];
    scrollLabelView.delegate = self;
    scrollLabelView.titleArray = titles;
    //设置label的字体
    scrollLabelView.titleFont = [UIFont systemFontOfSize:15];
    //设置文字颜色
    scrollLabelView.titleColor = [UIColor redColor];
    //设置停留时间
    scrollLabelView.stayInterval = 3.f;
    //设置滚动动画时间
    scrollLabelView.animationDuration = 1.f;
    [self.view addSubview:scrollLabelView];
    
    [scrollLabelView beginScrolling];
}
- (void)scrollLabelView:(WCScrollLabelView *)scrollLabelView didClickAtIndex:(NSInteger)index
{
    NSLog(@"点击%zd",index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
