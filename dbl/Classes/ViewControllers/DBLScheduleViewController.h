//
//  DBLScheduleViewController.h
//  DBL
//
//  Created by Ryan Emmons on 5/26/11.
//  Copyright 2011 Luck Stone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "DBLMapViewController.h"
#import "PullRefreshTableViewController.h"
#import "Reachability.h"
#import "DBLAppDelegate.h"
#import "SDZTickets.h"
#import "DBLAssignmentCell.h"
#import "DBLScheduleInfo.h"
#import "DBLCLController.h"
#import "DBLTicket.h"
#import "NSData+Base64.h"

@protocol SelfTicketDelegate

-(void)didRequestTicket;

@end

@interface SelfTicketController : UIViewController {
  UITextField *textamount;
  UISegmentedControl *segmentunit;
}

@property (nonatomic, assign) id<SelfTicketDelegate> delegate;

-(id)initWithPopoverSize: (CGSize) size;
-(BOOL)emptyFields;
-(NSString*)getUnitType;
-(double)getAmount;

@end


@interface DBLScheduleViewController : PullRefreshTableViewController <UIAlertViewDelegate, UIPopoverControllerDelegate, SelfTicketDelegate, CellDelegate> {
  Reachability *hostReach;
  SelfTicketController *vcSelfTicket;
  UIPopoverController *myPopoverController;
  
  DBLScheduleInfo *tempSchedule;
}

@property (nonatomic, retain) IBOutlet UIBarButtonItem *getLatestScheduleButton;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *spinner;
@property (nonatomic, retain) NSMutableArray *schedulearray;
@property (nonatomic, retain) NSMutableArray *sectionheadersarray;
@property (nonatomic, retain) NSMutableArray *sectionrowsarray;
@property (nonatomic, retain) UIView *disablingView;
@property (nonatomic, retain) UITextField *myDeviceID;

//core data add ons//
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
/////////////////////

- (IBAction)getLatestScheduleButtonClick:(id)sender;

@end

