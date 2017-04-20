# WCScrollLabelView
上下滚动的label

## 使用
```objc

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
    //开始滚动
    [scrollLabelView beginScrolling];


```
## 代理

```objc

- (void)scrollLabelView:(WCScrollLabelView *)scrollLabelView didClickAtIndex:(NSInteger)index
{
    NSLog(@"点击%zd",index);
}


```
## 效果图
 ![image](https://github.com/Verchen/WCScrollLabelView/raw/master/效果图.gif)

