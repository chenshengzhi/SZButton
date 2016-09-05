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
        CGRect targetImageRect = CGRectZero;
        [self targetTitleRect:NULL targetImageRect:&targetImageRect forContentRect:contentRect];
        return targetImageRect;
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
        CGRect targetTitleRect = CGRectZero;
        [self targetTitleRect:&targetTitleRect targetImageRect:NULL forContentRect:contentRect];
        return targetTitleRect;
    } else {
        return [super titleRectForContentRect:contentRect];
    }
}

- (void)targetTitleRect:(CGRect *)targetTitleRect
        targetImageRect:(CGRect *)targetImageRect
         forContentRect:(CGRect)contentRect {
    CGSize imageSize = self.currentImage.size;
    CGSize titleSize = [self.currentTitle sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    titleSize = CGSizeMake(ceil(titleSize.width), ceil(titleSize.height));

    CGFloat x = 0;
    CGFloat y = 0;
    if (self.vertical) {
        x = contentRect.origin.x + (contentRect.size.width/2 - titleSize.width/2);
        y = contentRect.origin.y + (contentRect.size.height
                                    - titleSize.height
                                    - self.paddingBetweenTitleLabelAndImageView
                                    - imageSize.height) / 2;

        if (targetTitleRect != NULL) {
            *targetTitleRect = CGRectMake(contentRect.origin.x + (contentRect.size.width/2 - titleSize.width/2),
                                          y,
                                          titleSize.width,
                                          titleSize.height);
            if (!self.titleAhead) {
                (*targetTitleRect).origin.y += imageSize.height + self.paddingBetweenTitleLabelAndImageView;
            }
        }

        if (targetImageRect != NULL) {
            *targetImageRect = CGRectMake(contentRect.origin.x + (contentRect.size.width/2 - imageSize.width/2),
                                          y,
                                          imageSize.width,
                                          imageSize.height);
            if (self.titleAhead) {
                (*targetImageRect).origin.y += titleSize.height + self.paddingBetweenTitleLabelAndImageView;
            }
        }
    } else {
        x = contentRect.origin.x + (contentRect.size.width
                                    - titleSize.width
                                    - self.paddingBetweenTitleLabelAndImageView
                                    - imageSize.width) / 2;

        if (targetTitleRect != NULL) {
            *targetTitleRect = CGRectMake(x,
                                          contentRect.origin.y + (contentRect.size.height/2 - titleSize.height/2),
                                          titleSize.width,
                                          titleSize.height);
            if (!self.titleAhead) {
                (*targetTitleRect).origin.x += imageSize.width + self.paddingBetweenTitleLabelAndImageView;
            }
        }

        if (targetImageRect != NULL) {
            *targetImageRect = CGRectMake(x,
                                          contentRect.origin.y + (contentRect.size.height/2 - imageSize.height/2),
                                          imageSize.width,
                                          imageSize.height);
            if (self.titleAhead) {
                (*targetImageRect).origin.x += titleSize.width + self.paddingBetweenTitleLabelAndImageView;
            }
        }
    }
}

@end
