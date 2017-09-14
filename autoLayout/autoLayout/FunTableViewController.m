//
//  FunTableViewController.m
//  autoLayout
//
//  Created by Thinkive on 2017/9/12.
//  Copyright © 2017年 Teo. All rights reserved.
//

#import "FunTableViewController.h"
#import "FunCell.h"
#import "PlayerDetailsViewController.h"

@interface FunTableViewController ()

@property (nonatomic, strong) NSMutableArray *dataSoure;


@end

@implementation FunTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSoure = @[@"Bill Evans",@"Dave",@"Oscar",@"Peterson",@"Brubeck"].mutableCopy;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSoure.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FunCell *cell = [tableView dequeueReusableCellWithIdentifier:@"funCell" forIndexPath:indexPath];
    cell.namLab.text = self.dataSoure[indexPath.row];
    return cell;
}



- (IBAction)cancelToPlayersViewController:(UIStoryboardSegue *)sender{

}

- (IBAction)savePlayerDetail:(UIStoryboardSegue *)sender{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        PlayerDetailsViewController *pd = sender.sourceViewController;
        [self.dataSoure insertObject:pd.textfield.text atIndex:0];
        NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
    });
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
