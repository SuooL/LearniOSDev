关于 iOS 的编程学习。

首先现在的可选语言工具有两种：一个是 swift，一个是 Objective-C 。经过我的了解，以及对现有知识经验的积累，还是先主要学习 Objective-C ，swift 可以慢慢来。毕竟 Objective-C 的语言积淀很深厚，在我的学习和工作过程中遇到问题被解决的可能性更大。

下面是学习的记录：

### 2015年11月27日

iOS 编程第二章，第三章学习完成。

主要内容是 Objective—C 的基础语法和语言特性。感觉 OC 和 XCode 的结合以及 OC 的特性使得 OC 的学习曲线并不难，而且 iOS 开发的效率也应该要比 Android 的快。

###2015年11月28日

iOS 编程第四章，第五章，第六章学习完成。

主要内容就是说明 iOS 开发中最基本也是最重要的内容之一：视图。

个人感觉视图类似于游戏开发中的 scene 或者 layer。目前觉得不方便的地方就是绘制方面，Objective-C 类在绘制方面功能有限，比如阴影和简便等效果没有封装，而是要使用偏于底层的 Core Graphics 所提供的接口。

本章的问题主要有三个：

1. Xcode6/7 新建文件的时候已经没有 Objective-C Class File 这一项了，改成了 iOS -> Source -> Cocoa Touch Class 这一项。

2. Xcode6/7 没有空模版了，但可以通过 Alcatraz 插件管理器来下载 "Xcode Empty Applicatioin" 模版

3. 原书使用的是 Xcode5，第4章的Hypnosistor项目代码在Xcode7下是跑不起来的，究其原因，是Xcode的编译器规则有改变，可以参考：
stackoverflow：(http://stackoverflow.com/questions/7520971/applications-are-expected-to-have-a-root-view-controller-at-the-end-of-applicati)
书中提到过运行时会报出警告信息"Application windows are expected to have a root view controller at the end of application launch.", 作者说可以忽略，但Xcode7中要求你必须指定一个root view才行，否则虽然能够编译通过，但是程序会被 Terminated by uncaught exception, 然后你在模拟器中的应用打开后只看到一片空白。
AppDelegate.m 文件中，书中是直接把 firstView 添加到 self.window 里去，Xcode7中这样是不行的，必须在AppDelegate.m中设置好一个<code>rootView controller</code>，然后扔到<code>self.window</code>里去，其余的<code>UIView</code>再通过addSubview的形式扔进rootView controller里去：
```
UIViewController *vc = [[UIViewController alloc] init];
[vc.view addSubview:firstView];
[self.window setRootViewController:vc];
```

4. 导致代码跑不起来的原因之二：是在Xcode7中新建一个<code>UIView</code>的子类的时候，Xcode7 不会给你写好 initWithFrame 构造函数，你必须自己写进去：
```
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
```

同时还要注意原文说 BNRHypnosisView.m 文件中应该有两个函数，initWithFrame是一个，另一个就是被注释掉的 drawRect 函数，你需要自己实现一个<code> -(void)drawRect:(CGRect)rect </code>函数.

### 2015年11月29日
