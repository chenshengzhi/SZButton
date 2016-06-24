//
//  SZButton.h
//  SZButton
//
//  Created by 陈圣治 on 16/6/24.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface SZButton : UIControl

@property (nonatomic, strong) IBInspectable NSString *text;
//[UIFont systemFontOfSize:18]
@property (nonatomic, strong) IBInspectable UIFont *font;
//[UIColor whiteColor]
@property (nonatomic, strong) IBInspectable UIColor *textColor;

@property (nonatomic, strong) IBInspectable UIImage *image;

//8
@property (nonatomic) IBInspectable CGFloat edgesPadding;
//NO
@property (nonatomic) IBInspectable BOOL isContentVertical;
//NO
@property (nonatomic) IBInspectable BOOL isTitleBegin;
//8
@property (nonatomic) IBInspectable CGFloat contentsPadding;

@property (nonatomic, strong) IBInspectable UIColor *normalBackgroundColor;
@property (nonatomic, strong) IBInspectable UIColor *highlightBackgroundColor;

@end
