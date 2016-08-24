//
//  SZButton.m
//  SZButton
//
//  Created by 陈圣治 on 16/6/24.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "SZButton.h"

@implementation SZButton

- (CGSize)szFittingSize {
    CGSize imageSize = self.currentImage.size;
    CGSize titleSize = [self.currentTitle sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    if (self.vertical) {
        CGFloat width = (self.contentEdgeInsets.left
                         + MAX(titleSize.width, imageSize.width)
                         + self.contentEdgeInsets.right);
        CGFloat height = (self.contentEdgeInsets.top
                          + titleSize.height
                          + self.paddingBetweenTitleLabelAndImageView
                          + imageSize.height
                          + self.contentEdgeInsets.bottom);
        return CGSizeMake(width, height);
    } else {
        CGFloat width = (self.contentEdgeInsets.left
                         + titleSize.width
                         + self.paddingBetweenTitleLabelAndImageView
                         + imageSize.width
                         + self.contentEdgeInsets.right);
        CGFloat height = (self.contentEdgeInsets.top
                          + MAX(titleSize.height, imageSize.height)
                          + self.contentEdgeInsets.bottom);
        return CGSizeMake(width, height);
    }
}

- (CGSize)sizeThatFits:(CGSize)size {
    return [self szFittingSize];
}

- (CGSize)intrinsicContentSize {
    return [self szFittingSize];
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    if (CGRectEqualToRect(contentRect, CGRectZero)) {
        return CGRectZero;
    }
    if (self.currentImage) {
        CGSize imageSize = self.currentImage.size;
        CGFloat x = 0;
        CGFloat y = 0;
        if (self.vertical) {
            x = contentRect.origin.x + (contentRect.size.width/2 - imageSize.width/2);
            if (self.titleAhead) {
                y = CGRectGetMaxY(contentRect) - imageSize.height;
            } else {
                y = contentRect.origin.y;
            }
            return CGRectMake(x, y, imageSize.width, imageSize.height);
        } else {
            if (self.titleAhead) {
                x = CGRectGetMaxX(contentRect) - imageSize.width;
            } else {
                x = contentRect.origin.x;
            }
            y = contentRect.origin.y + (contentRect.size.height/2 - imageSize.height/2);
        }
        return CGRectMake(x, y, imageSize.width, imageSize.height);
    } else {
        return [super imageRectForContentRect:contentRect];
    }
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    if (CGRectEqualToRect(contentRect, CGRectZero)) {
        return CGRectZero;
    }
    if (self.currentTitle) {
        if (CGSizeEqualToSize([super titleRectForContentRect:contentRect].size, CGSizeZero)) {
            return CGRectZero;
        }
        CGSize titleSize = [self.currentTitle sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
        CGFloat x = 0;
        CGFloat y = 0;
        if (self.vertical) {
            x = contentRect.origin.x + (contentRect.size.width/2 - titleSize.width/2);
            if (!self.titleAhead) {
                y = CGRectGetMaxY(contentRect) - titleSize.height;
            } else {
                y = contentRect.origin.y;
            }
        } else {
            if (!self.titleAhead) {
                x = CGRectGetMaxX(contentRect) - titleSize.width;
            } else {
                x = contentRect.origin.x;
            }
            y = contentRect.origin.y + (contentRect.size.height/2 - titleSize.height/2);
        }
        return CGRectMake(x, y, titleSize.width, titleSize.height);
    } else {
        return [super titleRectForContentRect:contentRect];
    }
}

@end
