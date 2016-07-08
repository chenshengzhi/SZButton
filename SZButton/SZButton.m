//
//  SZButton.m
//  SZButton
//
//  Created by 陈圣治 on 16/6/24.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "SZButton.h"

@interface SZButton ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation SZButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.font = [UIFont systemFontOfSize:18];
    self.textColor = [UIColor whiteColor];
    
    _edgesPadding = 8;
    _contentsPadding = 8;
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = self.font;
    _titleLabel.textColor = self.textColor;
    _titleLabel.numberOfLines = 0;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
    
    _imageView = [[UIImageView alloc] init];
    [self addSubview:_imageView];
}

- (CGSize)szFittingSize {
    [_titleLabel sizeToFit];
    [_imageView sizeToFit];
    
    if (_isContentVertical) {
        return CGSizeMake(MAX(_titleLabel.frame.size.width, _imageView.frame.size.width) + _edgesPadding*2,
                          _titleLabel.frame.size.height + _contentsPadding + _imageView.frame.size.height + _edgesPadding*2);
    } else {
        return CGSizeMake(_titleLabel.frame.size.width + _contentsPadding + _imageView.frame.size.width + _edgesPadding*2,
                          MAX(_titleLabel.frame.size.height, _imageView.frame.size.height) + _edgesPadding*2);
    }
}

- (CGSize)sizeThatFits:(CGSize)size {
    return [self szFittingSize];
}

- (CGSize)intrinsicContentSize {
    return [self szFittingSize];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.isHighlighted) {
        self.backgroundColor = _highlightBackgroundColor;
    } else {
        self.backgroundColor = _normalBackgroundColor;
    }
    
    [_titleLabel sizeToFit];
    [_imageView sizeToFit];
    
    if (_isContentVertical) {
        CGPoint center = CGPointMake(self.frame.size.width/2, 0);
        center.y = (self.frame.size.height - _titleLabel.frame.size.height - _contentsPadding - _imageView.frame.size.height)/2;
        if (_isTitleBegin) {
            center.y += _titleLabel.frame.size.height/2;
            _titleLabel.center = center;
            center.y += _titleLabel.frame.size.height/2 + _imageView.frame.size.height/2 + _contentsPadding;
            _imageView.center = center;
        } else {
            center.y += _imageView.frame.size.height/2;
            _imageView.center = center;
            center.y += _imageView.frame.size.height/2 + _contentsPadding + _titleLabel.frame.size.height/2;
            _titleLabel.center = center;
        }
    } else {
        CGPoint center = CGPointMake(0, self.frame.size.height/2);
        center.x = (self.frame.size.width - _titleLabel.frame.size.width - _contentsPadding - _imageView.frame.size.width)/2;
        if (_isTitleBegin) {
            center.x += _titleLabel.frame.size.width/2;
            _titleLabel.center = center;
            center.x += _titleLabel.frame.size.width/2 + _imageView.frame.size.width/2 + _contentsPadding;
            _imageView.center = center;
        } else {
            center.x += _imageView.frame.size.width/2;
            _imageView.center = center;
            center.x += _imageView.frame.size.width/2 + _contentsPadding + _titleLabel.frame.size.width/2;
            _titleLabel.center = center;
        }
    }
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        self.backgroundColor = _highlightBackgroundColor;
    } else {
        self.backgroundColor = _normalBackgroundColor;
    }
}

- (void)setText:(NSString *)text {
    _titleLabel.text = text;
    
    [self invalidateIntrinsicContentSize];
    [self setNeedsLayout];
}

- (NSString *)text {
    return _titleLabel.text;
}

- (void)setFont:(UIFont *)font {
    _font = font;
    _titleLabel.font = font;
    
    [self invalidateIntrinsicContentSize];
    [self setNeedsLayout];
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    
    _titleLabel.textColor = textColor;
    [self setNeedsLayout];
}

- (void)setImage:(UIImage *)image {
    _imageView.image = image;
    
    [self invalidateIntrinsicContentSize];
    [self setNeedsLayout];
}

- (UIImage *)image {
    return _imageView.image;
}

- (void)setNormalBackgroundColor:(UIColor *)normalBackgroundColor {
    _normalBackgroundColor = normalBackgroundColor;
    
    [self setNeedsLayout];
}

- (void)setHighlightBackgroundColor:(UIColor *)highlightBackgroundColor {
    _highlightBackgroundColor = highlightBackgroundColor;
    
    [self setNeedsLayout];
}

@end
