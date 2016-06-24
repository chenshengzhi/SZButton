//
//  SZButton.m
//  SZButton
//
//  Created by 陈圣治 on 16/6/24.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "SZButton.h"

#ifdef DEBUG
#define CLog(fmt, ...) NSLog((@" %d %s " fmt), __LINE__, __PRETTY_FUNCTION__,  ##__VA_ARGS__)
#else
#define CLog(fmt, ...) do{}while(0)
#endif

@implementation SZButton

- (CGSize)szFittingSize {
    CGSize imageSize = self.currentImage.size;
    CGSize titleSize = [self.currentTitle boundingRectWithSize:CGSizeZero
                                                       options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                                    attributes:@{NSFontAttributeName: self.titleLabel.font}
                                                       context:nil].size;

    if (_layoutImageTitleVertical) {
        return CGSizeMake(MAX(imageSize.width, titleSize.width), imageSize.height + _paddingBetweenImageAndTitle + titleSize.height);
    } else {
        return CGSizeMake(imageSize.width + _paddingBetweenImageAndTitle + titleSize.width, MAX(imageSize.height, titleSize.height));
    }
}

- (CGSize)intrinsicContentSize {
    return [self szFittingSize];
}

- (CGSize)sizeThatFits:(CGSize)size {
    return [self szFittingSize];
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    if (CGSizeEqualToSize([super titleRectForContentRect:contentRect].size, CGSizeZero)) {
        return CGRectZero;
    }

    CGRect titleRect = CGRectZero;
    titleRect.size = [self.currentTitle boundingRectWithSize:CGSizeZero
                                                            options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                                         attributes:@{NSFontAttributeName: self.titleLabel.font}
                                                            context:nil].size;

    if (_layoutImageTitleVertical) {
        titleRect.origin.x = contentRect.size.width/2 - titleRect.size.width/2;
        titleRect.origin.y = contentRect.size.height/2 - titleRect.size.height/2 + self.currentImage.size.height/2 + _paddingBetweenImageAndTitle/2;
    } else {
        titleRect.origin.x = contentRect.size.width/2 - titleRect.size.width/2 + self.currentImage.size.width/2 + _paddingBetweenImageAndTitle/2;
        titleRect.origin.y = contentRect.size.height/2 - titleRect.size.height/2;
    }
    return titleRect;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGRect imageRect = [super imageRectForContentRect:contentRect];
    CGSize titleSize = [self titleRectForContentRect:contentRect].size;

    if (_layoutImageTitleVertical) {
        imageRect.origin.x = contentRect.size.width/2 - imageRect.size.width/2;
        imageRect.origin.y = (contentRect.size.height - imageRect.size.height - titleSize.height - _paddingBetweenImageAndTitle)/2;
    } else {
        imageRect.origin.x = (contentRect.size.width - imageRect.size.width - titleSize.width - _paddingBetweenImageAndTitle)/2;
        imageRect.origin.y = contentRect.size.height/2 - imageRect.size.height/2;
    }

    return imageRect;
}

@end
