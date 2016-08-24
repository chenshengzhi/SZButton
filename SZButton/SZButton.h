//
//  SZButton.h
//  SZButton
//
//  Created by 陈圣治 on 16/6/24.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface SZButton : UIButton

@property (nonatomic) IBInspectable BOOL vertical;
@property (nonatomic) IBInspectable BOOL titleAhead;
@property (nonatomic) IBInspectable CGFloat paddingBetweenTitleLabelAndImageView;

@end
