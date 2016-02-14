//
//  HeadView.m
//  LastTry
//
//  Created by 胡振生 on 16/2/14.
//  Copyright © 2016年 胡振生. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView

+(instancetype)headerView{
        return [[[UINib nibWithNibName:@"HeadView" bundle:nil] instantiateWithOwner:nil options:nil] lastObject];
}

-(void)awakeFromNib{
    // Do any additional setup after loading the view, typically from a nib.
    int count = 5;
    CGSize size = self.scrollViewAD.frame.size;
    //1 动态生成5个imageView
    for (int i = 0; i < count; i++) {
        //
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.scrollViewAD addSubview:iconView];
        
        NSString *imgName = [NSString stringWithFormat:@"ad_%02d",i];
        iconView.image = [UIImage imageNamed:imgName];
        
        CGFloat x = i * size.width;
        //frame
        iconView.frame = CGRectMake(x, 0, size.width, size.height);
    }
    
    //2 设置滚动范围
    self.scrollViewAD.contentSize = CGSizeMake(count * size.width, 0);
    
    
    self.scrollViewAD.showsHorizontalScrollIndicator = NO;
    //3 设置分页
    self.scrollViewAD.pagingEnabled = YES;
    
    //4 设置pageControl
    self.pageControl.numberOfPages = count;
    
    //5 设置scrollView的代理
    // self.scrollViewAD.delegate = self;
    
    //6 定时器
    [self addTimer];
}

- (void)addTimer
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    self.timer = timer;
    //消息循环
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    [runloop addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)nextImage
{
    //当前页码
    NSInteger page = self.pageControl.currentPage;
    
    if (page == self.pageControl.numberOfPages - 1) {
        page = 0;
    }else{
        page++;
    }
    
    //    self.scrollView setContentOffset:<#(CGPoint)#> animated:<#(BOOL)#>
    
    CGFloat offsetX = page * self.scrollViewAD.frame.size.width;
    [UIView animateWithDuration:1.0 animations:^{
        self.scrollViewAD.contentOffset = CGPointMake(offsetX, 0);
    }];
    
}

#pragma mark - scrollView的代理方法
//正在滚动的时候
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //   (offset.x + 100/2)/100
    int page = (scrollView.contentOffset.x + scrollView.frame.size.width / 2)/ scrollView.frame.size.width;
    self.pageControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //停止定时器
    [self.timer invalidate];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
    //    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
