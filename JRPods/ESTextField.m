//
//  UITextBox.m
//  Eruntech
//
//  Created by 杜明悦 on 12-10-25.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "ESTextField.h"


@implementation ESTextField
@synthesize collectSign=_collectSign;
@synthesize isRequired=_isRequired;
@synthesize name=_name;
@synthesize dataType=_dataType;
@synthesize isRequiredTooltip=_isRequiredTooltip;
@synthesize context=_context;
@synthesize regularTooltip=_regularTooltip;
@synthesize regular=_regular;
@synthesize placeholderColor=_placeholderColor;
@synthesize viewController=_viewController;

/**
 初始化事件
 **/
-(void)initializ
{
    _viewController = [self searchViewController];
}

/**
 添加事nonatomic, 件
 **/
-(void)addEvent
{
    [self addTarget:self action:@selector(textBoxChanged:) forControlEvents:UIControlEventEditingDidBegin];
}

-(void)textBoxChanged:(id)sender
{
    [self dataValidator];
    NSLog(@"文本校验事件");
}

/**
 获取采集标记名
 **/
-(NSArray*) getRequest
{
    NSArray* array = [[NSArray alloc] initWithObjects:_name, nil];
    return array;
}

/**
 将数据发布到指定位置
 **/
-(void) release:(NSString *)dataName data:(Data *)data
{
    if (data != nil && [data.name isEqualToString:_name]) {
        [self setText:(NSString*)data.value];
    }
}

/**
 数据收集，返回ETDataCollection
 **/
-(DataCollection*) collect
{
    DataCollection *datas = [[DataCollection alloc] initWithCapacity:1];
    Data *data = [[Data alloc] initWithDataName:self.name dataValue:self.text];
    [datas addObject:data];
    return datas;
}

/**
 设置采集标记，多个标记以‘|!’分割
 例如：ForSave|!ForQuery
 @param sign 采集标记
 **/
-(void)setCollectSign:(NSMutableString *)sign{
    _collectSign=sign;
}

/**
 获取收集标记集合，返回NSString[]
 **/
-(NSString *) getCollectSign
{
    return _collectSign;
}


-(NSString*) getName
{
    return _name;
}

-(BOOL)dataValidator
{
    //如果不能为空，则提示消息
    if(_isRequired && [[self.text trim] isEqualToString:@""]){
        [self.viewController.view makeToast:_isRequiredTooltip duration:3.0
                                   position:CSToastPositionCenter];
        return NO;
    }
    //正则表达式严重不通过则提示错误
    if(_regular != nil && [[_regular trim] isEqualToString:@""]==NO){
        if ([Validator validataWithValue:self.text regular:_regular]==NO) {
            [self.viewController.view makeToast:_regularTooltip duration:3.0
                                       position:CSToastPositionCenter];
            return NO;
        }
    }
    return YES;
}

-(void)drawRect:(CGRect)rect{

}

-(void)drawPlaceholderInRect:(CGRect)rect{
    [_placeholderColor setFill];
    CGRect plrect = CGRectMake(rect.origin.x, rect.origin.y+rect.size.height/4, rect.size.width, rect.size.height);
    [[self placeholder] drawInRect:plrect withFont:[UIFont systemFontOfSize:13]];
}
@end
