//
//  EaseStartView.m
//  Coding_iOS
//
//  Created by Ease on 14/12/26.
//  Copyright (c) 2014年 Coding. All rights reserved.
//

#import "EaseStartView.h"
#define kKeyWindow [UIApplication sharedApplication].keyWindow
#define kScreen_Bounds [UIScreen mainScreen].bounds
@interface EaseStartView ()
@property (strong, nonatomic) UIImageView *bgImageView;
@end

@implementation EaseStartView

+ (instancetype)startView{    
    return [[self alloc] initWithBgImage:[UIImage imageNamed:@"百视TV1024"]];
}

- (instancetype)initWithBgImage:(UIImage *)bgImage{
    self = [super initWithFrame:kScreen_Bounds];
    if (self) {
        //add custom code
        self.backgroundColor = [UIColor clearColor];;
        _bgImageView = [[UIImageView alloc] initWithFrame:kScreen_Bounds];
        _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        _bgImageView.alpha = 1.0;
        [self addSubview:_bgImageView];
        [self configWithBgImage:bgImage ];
    }
    return self;
}

- (void)configWithBgImage:(UIImage *)bgImage{
    self.bgImageView.image = bgImage;
    [self updateConstraintsIfNeeded];
}

- (void)startAnimationWithCompletionBlock:(void(^)(EaseStartView *easeStartView))completionHandler{
    [kKeyWindow addSubview:self];
    [kKeyWindow bringSubviewToFront:self];
    _bgImageView.alpha = 1.0;
    [UIView animateWithDuration:2.0 animations:^{
       
        self.bgImageView.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.6 delay:0.3 options:UIViewAnimationOptionCurveEaseIn animations:^{
            _bgImageView.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            if (completionHandler) {
                completionHandler(self);
            }
        }];
    }];
}

@end
