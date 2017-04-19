//
//  LWTTableViewCell.h
//  MasonryCellHeight
//
//  Created by iosdev on 16/11/8.
//  Copyright © 2016年 iosdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWTModel.h"

@interface LWTTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *L1;
@property (weak, nonatomic) IBOutlet UILabel *L2;
@property (weak, nonatomic) IBOutlet UILabel *L3;
@property (weak, nonatomic) IBOutlet UILabel *L4;
@property (weak, nonatomic) IBOutlet UILabel *L5;
@property (weak, nonatomic) IBOutlet UIView *V1;
@property (weak, nonatomic) IBOutlet UIView *V2;

@property (nonatomic, strong) LWTModel *m;
- (void)setCellContent:(LWTModel *)model;

+ (LWTTableViewCell *)shareInstance;
@end
