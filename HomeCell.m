//
//  HomeCell.m
//  Push1126
//
//  Created by 劉坤昶 on 2015/11/26.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (void)awakeFromNib {
    // Initialization code
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.bigPhoto = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 120)];
        [self.contentView addSubview:self.bigPhoto];
        
        self.topicLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, 100, 30)];
        self.topicLabel.textColor = [UIColor blackColor];
        self.topicLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.topicLabel];
        
        
        
    }
    
    
    
    return  self;
}







- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
