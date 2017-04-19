//
//  LWTTableViewCell.m
//  MasonryCellHeight
//
//  Created by iosdev on 16/11/8.
//  Copyright © 2016年 iosdev. All rights reserved.
//

#import "LWTTableViewCell.h"

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
@implementation LWTTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self addMas];
}
- (id)init{
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"LWTTableViewCell" owner:self options:nil];
    self = [nib lastObject];
    if (self) {
        
    }
    return self;
}
- (void)setCellContent:(LWTModel *)model{
    self.m = model;
    self.L1.text = self.m.t1;
    self.L2.text = self.m.t2;
    self.L3.text = self.m.t3;
    self.L4.text = self.m.t4;
    self.L5.text = self.m.t5;
}
//添加约束
- (void)addMas{
    __weak typeof(self)wself = self;
    CGFloat one_W = (SCREENWIDTH - 32 - 10)/3;
    [self.L1 makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo (16);
        make.top.mas_equalTo (10);
        make.width.mas_lessThanOrEqualTo (one_W);
    }];
    
    [self.L2 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (wself.L1.mas_right).offset(5);
        make.top.mas_equalTo (10);
        make.width.mas_lessThanOrEqualTo (one_W);
    }];
    
    [self.L3 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (wself.L2.mas_right).offset(5);
        make.top.mas_equalTo (10);
        make.width.mas_lessThanOrEqualTo (one_W);
    }];
    
    [self.V1 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (wself.L1.mas_left);
        make.top.equalTo (wself.L1.mas_bottom).offset(5);
        make.width.equalTo(wself.contentView).offset(-32);
        make.height.mas_equalTo(120);
    }];
    
    [self.L4 makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(wself.V1).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.V2 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(wself.V1.mas_left);
        make.top.equalTo(wself.V1.mas_bottom).offset(5);
        make.width.equalTo(wself.V1.width);
        make.height.mas_equalTo(1);
    }];
    
    [self.L5 makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo (wself.V1.mas_right);
        make.top.equalTo (wself.V2.mas_bottom).offset(5);
        make.width.mas_lessThanOrEqualTo (SCREENWIDTH -32);
        make.bottom.equalTo (wself.contentView.mas_bottom).offset(-10);
    }];
    
}

+ (LWTTableViewCell *)shareInstance{
    static LWTTableViewCell *cellInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        cellInstance = [[self alloc]init];
    });
    return cellInstance;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
