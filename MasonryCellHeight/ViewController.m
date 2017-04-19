//
//  ViewController.m
//  MasonryCellHeight
//
//  Created by iosdev on 16/11/8.
//  Copyright © 2016年 iosdev. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "LWTModel.h"
#import "LWTTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.layer.borderColor = [UIColor redColor].CGColor;
    self.tableView.layer.borderWidth = 2.0f;
    __weak typeof(self)wself = self;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(wself.view).with.insets(UIEdgeInsetsMake(20, 0, 0, 0));
    }];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 5, 0);
    [self createData];
    
}
- (void)createData{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    NSArray *t = @[@"按数据库会打死",@"圣诞节拉时间都拉到就",@"加速度", @"打牌不撒谎的北京", @"dddd", @"sadipoasdlashdoas", @"dasfs你打开了呢", @"这是特别长的文字内容:阿来得及;阿斯顿和沙发垫付是对方考虑是电风扇[拍;'A [PANFJ FIOFM,ABD  你KJ SNLKSDFN 开发商菲尼克斯阿卡积分你是否沙卡拉卡看沙发上带你飞回家地方方法是玻璃案件发生农夫三",@"2eqwe",@"weqwe",@"weiwqe9999但", @"爱多啥都拉上电话", @"拍打快点跑",@"案时段是大家", @"暗杀时间到了",@"908798",@"打开的", @"大声道", @"大大挨打他他", @"王培培乔恩=- 9-[", @"阿迪阿斯卡到了呢"];
    for (int i = 0; i < 20; i++) {
        int idx = arc4random() % ((t.count-1)/2);
        LWTModel *m = [[LWTModel alloc]init];
        m.t1 = t[idx];
        m.t2 = t[idx+1];
        m.t3 = t[idx+2];
        m.t4 = t[idx+3];
        m.t5 = t[idx+4];
        [arr addObject:m];
    }
    self.data = arr;
//    LWTTableViewCell *cell = [LWTTableViewCell shareInstance];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idf = @"cellId";
    LWTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idf];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:@"LWTTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:idf];
        cell = [tableView dequeueReusableCellWithIdentifier:idf];
    }
    [cell setCellContent:self.data[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LWTTableViewCell *cell = [LWTTableViewCell shareInstance];
    //返回cell之前重新刷新约束，重新计算高度
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    [cell setCellContent:self.data[indexPath.row]];
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return height;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
