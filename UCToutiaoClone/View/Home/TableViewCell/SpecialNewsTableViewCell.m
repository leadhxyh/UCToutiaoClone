//
//  SpecialNewsTableViewCell.m
//  UCToutiaoClone
//
//  Created by zhiyi on 16/9/20.
//  Copyright © 2016年 lzy. All rights reserved.
//

#import "SpecialNewsTableViewCell.h"
#import "Masonry.h"
#import "ZYHArticleModel.h"
#import "UIColor+hexColor.h"

#define TITLE_FONT_SIZE 12.f
#define LEADING_CELL 10
#define TOP_BOTTOM_MARGIN 6

//todo 样式：左边有条彩色线
@interface SpecialNewsTableViewCell ()
@property (strong, nonatomic) UILabel *titleLabel;
@end

@implementation SpecialNewsTableViewCell
+ (NSString *)cellReuseIdentifier {
    return @"SpecialNewsTableViewCell";
}

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        [self setupCell];
//    }
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupCell];
    }
    return self;
}

- (void)setupCell {
    self.titleLabel = [[UILabel alloc] init];
    [_titleLabel setFont:[UIFont systemFontOfSize:TITLE_FONT_SIZE]];
    [self.contentView addSubview:_titleLabel];
    
    UIView *colorBlock = [[UIView alloc] init];
    [colorBlock setBackgroundColor:[UIColor hexColor:@"F9B53A"]];
    [self.contentView addSubview:colorBlock];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(TOP_BOTTOM_MARGIN);
        make.centerY.equalTo(self.contentView);
        make.leading.equalTo(self.contentView).offset(LEADING_CELL);
    }];
    
    [colorBlock mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(_titleLabel.mas_height);
        make.width.equalTo(@3);
        make.leading.equalTo(self.contentView).offset(3);
        make.centerY.equalTo(self.contentView);
    }];
}

- (void)updateCellWithModel:(ZYHArticleModel *)model {
    [_titleLabel setText:model.articleTitle];
}

@end
