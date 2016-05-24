//
//  LCETextDetailViewController.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/24.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "LCETextDetailViewController.h"
#import "NSString+Contain.h"

@interface LCETextDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *cotentLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation LCETextDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = self.model.title;
    if ([self.model.text contains:@"<p>"]) {
        [self.model.text stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    }
    if ([self.model.text contains:@"</p><p>"]) {
        NSString *str = [self.model.text stringByReplacingOccurrencesOfString:@"</p><p>" withString:@"           "];
//        NSRange range = [self.model.text rangeOfString:@"</p><p>"];
//        NSString *str = [self.model.text stringByReplacingCharactersInRange:range withString:@"\n"];
        self.model.text = str;
    }
    self.cotentLabel.text = [NSString stringWithFormat:@"        %@", self.model.text];
    self.dateLabel.text = self.model.ct;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
