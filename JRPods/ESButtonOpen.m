//
//  ButtonOpen.m
//  Eruntech
//
//  Created by 杜明悦 on 13-2-21.
//
//

#import "ESButtonOpen.h"

@implementation ESButtonOpen

@synthesize openViewController=_openViewController;
@synthesize sign=_sign;
@synthesize isValidate=_isValidate;
@synthesize viewController=_viewController;


-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    [self redStyle];
    [self invalidateIntrinsicContentSize];
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self redStyle];
    return self;
}

/**
 初始化事件
 **/
-(void)initializ
{
    [self redStyle];
    [self addEvent];
    _viewController=(BaseViewController*)[self searchViewController];
}

/**
 添加事件
 **/
-(void)addEvent
{
    [self addTarget:self action:@selector(btnOpenClick:) forControlEvents:UIControlEventTouchUpInside];
}

/**
 单击事件执行
 **/
-(void)btnOpenClick:(id)sender
{
    if(_isValidate == YES){
        BOOL result = [self.viewController validator];
        if(self.viewController != nil && result==YES){
            [self open];
        }
    }else{
        [self open];
    }
}

/**
 实例化并呈现目标UIViewController
 **/
-(void) open
{
    @try
    {
        //反射获取目标UIViewController实例
        id obj = [[NSClassFromString(_openViewController) alloc] init];
        UIViewController* tagViewController = [obj initWithNibName:_openViewController bundle:nil];
        BaseViewController* baseTagViewController = (BaseViewController*)tagViewController;
        if ([_sign isEqualToString:@""]==NO) {
            ESCollectViewController *viewCollect=[[ESCollectViewController new] initWithViewController:_viewController sign:_sign];
            DataCollection *params = [viewCollect collect];
            
            if(self.viewController.baseNavigationController != nil && baseTagViewController != nil){
                [self.viewController.baseNavigationController pushViewController:baseTagViewController params:params passValueDelegate:self.viewController animated:YES];
            }else{
                [self.viewController.view makeToast:@"未设置目标视图控制器或当期baseNavigationController失效" duration:3.0
                                           position:CSToastPositionCenter];
            }
        }
        else
        {
            if(self.viewController.baseNavigationController != nil && baseTagViewController != nil){
                [self.viewController.baseNavigationController pushViewController:baseTagViewController params:nil passValueDelegate:self.viewController animated:YES];
            }else{
                [self.viewController.view makeToast:@"未设置目标视图控制器或当期baseNavigationController失效" duration:3.0
                                           position:CSToastPositionCenter];
            }
        }

    }
    @catch (NSException *exception) {
        @throw exception;
    }
    @finally {
        
    }
}

@end
