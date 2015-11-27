//
//  HomeTVC.m
//  Push1126
//
//  Created by 劉坤昶 on 2015/11/26.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "HomeTVC.h"
#import "HomeCell.h"


#import <Parse/Parse.h>

@interface HomeTVC ()
{
    NSMutableArray *locoDataArray;
    
}
@end

@implementation HomeTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[HomeCell class] forCellReuseIdentifier:@"HomeCell"];
    
    self.tableView.rowHeight = 200;
   
    locoDataArray = [[NSMutableArray alloc]init];

    [self parseDownload];


}



-(void)parseDownload
{
    PFQuery *query = [PFQuery queryWithClassName:@"basicData"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        for (PFObject *allObjects in objects) {
           
            NSString *title = allObjects[@"title"];
            PFFile *myPhoto = allObjects[@"image"];
            
            [myPhoto getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
                
                if (error == nil) {
                    
                UIImage *image = [[UIImage alloc] initWithData:data];
                
                NSDictionary *getDataDic =
                
                [NSDictionary dictionaryWithObjectsAndKeys:title,@"title",image,@"image", nil];
                
                [locoDataArray addObject:getDataDic];
                    
                }
            
                [self.tableView reloadData];

            }];
        
        }
        NSLog(@"下載成功");
    }];
    
    
}

















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return locoDataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell" forIndexPath:indexPath];
    
    NSDictionary *dicForCell = locoDataArray[indexPath.row];
    
    cell.bigPhoto.image = dicForCell[@"image"];
    cell.topicLabel.text = dicForCell[@"title"];
    
    
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
