//
//  DBLAssignmentCell.m
//  DBL
//
//  Created by Tobias O'Leary on 2/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DBLAssignmentCell.h"

#import "SDZTickets.h"
#import "DBLCLController.h"
#import "DBLScheduleInfo.h"

@implementation DBLAssignmentCell
@synthesize imageView;
@synthesize textLabel;
@synthesize loadedButton;
@synthesize schedule;
@synthesize delegate;

const int kLoadedStatus = 1;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      if (![self.schedule.allowselfticket boolValue]) {
        [self.ticketButton setHidden:YES];
        [self.ticketButton setUserInteractionEnabled:NO];
      }
      else {
        [self.ticketButton setHidden:NO];
        [self.ticketButton setUserInteractionEnabled:YES];
      }
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
  [imageView release];
  [textLabel release];
  [loadedButton release];
  [_infoView release];
    [_ticketButton release];
    [_middleFrame release];
  [super dealloc];
}

- (IBAction)loadedClicked:(id)sender {
  
  [self setCompleted:YES];
  CLLocation *locationToSend = [[DBLCLController sharedCLController] lastLocation];

  
  SDZTickets *service = [[SDZTickets alloc] init];
  [service LoadedDelivered:self
                    action:@selector(handleTicketDelivered:)
                  deviceid:[APP_DELEGATE deviceId]
                      udid:[APP_DELEGATE UDID]
         delivereddatetime:[NSDate date]
                  latitude:[NSString stringWithFormat:@"%f", [locationToSend coordinate].latitude]
                 longitude:[NSString stringWithFormat:@"%f", [locationToSend coordinate].longitude]
              ticketnumber:@""
              locationcode:[NSString stringWithFormat:@"%d", [[[self schedule] locationCode] intValue]]
                    status:kLoadedStatus];
  
  [service release];
  
}

- (IBAction)ticketClicked:(id)sender {
  [self.delegate clickedSelfTicket:self.schedule];
}

- (void) handleTicketDelivered: (id) value {
  
	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}
  
	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
  
  
	// Do something with the NSString* result
  NSString* result = (NSString*)value;
	NSLog(@"LoadedDelivered returned the value: %@", result);
  
}

- (void)setCompleted:(BOOL)isCompleted;
{
  if(isCompleted) {
    [[self imageView] setImage:[UIImage imageNamed:@"assignment_completed"]];
    [[self loadedButton] setHidden:YES];
    [self.ticketButton setHidden:YES];
  } else {
    [[self imageView] setImage:[UIImage imageNamed:@"thumbtack_note_assignment"]];
    [[self loadedButton] setHidden:NO];
    [self.ticketButton setHidden:NO];
  }
}

@end
