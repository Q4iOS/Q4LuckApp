//
//  DBLAssignmentCell.h
//  DBL
//
//  Created by Tobias O'Leary on 2/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DBLScheduleInfo;

@protocol CellDelegate <NSObject>

-(void)clickedSelfTicket:(DBLScheduleInfo*)schedule;

@end

@interface DBLAssignmentCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (retain, nonatomic) IBOutlet UIButton *loadedButton;
@property (retain, nonatomic) DBLScheduleInfo *schedule;
@property (retain, nonatomic) IBOutlet UIView *infoView;
@property (retain, nonatomic) IBOutlet UIButton *ticketButton;
@property (retain, nonatomic) IBOutlet UIView *middleFrame;
@property (assign, nonatomic) id<CellDelegate> delegate;

- (IBAction)loadedClicked:(id)sender;
- (IBAction)ticketClicked:(id)sender;

//Updates Cell Style to make is look completed.
- (void)setCompleted:(BOOL)isCompleted;

@end