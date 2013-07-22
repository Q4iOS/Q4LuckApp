//
//  DBLScheduleViewController.m
//  DBL
//
//  Created by Ryan Emmons on 5/26/11.
//  Copyright 2011 Luck Stone. All rights reserved.
//

#define TICKET_WINDOW_SIZE CGSizeMake(540, 400)
#define ALERT_SCHEDULE_CONFIRM_TICKET 5050

#import "DBLScheduleViewController.h"



@implementation SelfTicketController

@synthesize delegate;

-(id)initWithPopoverSize: (CGSize) size {
  self = [super init];
  if (self) {
    [self setContentSizeForViewInPopover:size];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    textamount = [[UITextField alloc]initWithFrame:CGRectMake(10, 10, size.width-20, 30)];
    [textamount setPlaceholder:@"Enter the requested net weight of the load."];
    [textamount setBorderStyle:UITextBorderStyleBezel];
    [textamount setKeyboardType:UIKeyboardTypeNumberPad];
    
    segmentunit = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"US Tons", @"US Lbs", @"Metric KG", @"Metric Tonnes", nil]];
    [segmentunit setFrame:CGRectMake(10, 50, size.width-20, 44)];
    [segmentunit setSelectedSegmentIndex:0];
    
    UIButton *done = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [done setFrame:CGRectMake(50, 120, size.width-100, 40)];
    [done setTitle:@"Request Ticket" forState:UIControlStateNormal];
    [done addTarget:self action:@selector(doneClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:done];
    [self.view addSubview:segmentunit];
    [self.view addSubview:textamount];
  }
  return self;
}

-(void)doneClick {
  NSMutableCharacterSet *decimals = [NSMutableCharacterSet characterSetWithCharactersInString:@"[0-9]."];
  [decimals formUnionWithCharacterSet:[NSCharacterSet alphanumericCharacterSet]];
  NSCharacterSet* notDigits = [decimals invertedSet];
  
  if ([textamount.text rangeOfCharacterFromSet:notDigits].location == NSNotFound) {
    [self.delegate didRequestTicket];
  }
  else {
    UIAlertView *newAlert = [[UIAlertView alloc]initWithTitle:@"" message:@"Please enter decimal numbers only."  delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [newAlert show];
  }
}

-(BOOL)emptyFields {
  if (textamount.text.length == 0) {
    return YES;
  }
  if (segmentunit.selectedSegmentIndex == UISegmentedControlNoSegment) {
    return YES;
  }
  return NO;
}

-(NSString*)getUnitType {
  NSString *unit;
  switch (segmentunit.selectedSegmentIndex) {
    case 0:
      unit = @"tons";
      break;
      
    case 1:
      unit = @"lbs";
      break;
      
    case 2:
      unit = @"kgs";
      break;
      
    case 3:
      unit = @"tonnes";
      break;
      
    default:
      break;
  }
  
  return unit;
}

-(double)getAmount {
  return [textamount.text doubleValue];
}

@end



#pragma mark - Interface
@interface DBLScheduleViewController ()
- (void)showLoading;
- (void)hideLoading;
- (void)showPopup:(NSString *)message;
- (void)getScheduleFromWebService;
- (void)addCoreDataScheduleToArray:(id)schedule;
- (void)fetchScheduleFromCoreData;
- (void)updateScheduleTable;
- (void)StoreScheduleinCoreData: (id)sched;
@end


@implementation DBLScheduleViewController

@synthesize getLatestScheduleButton, spinner;
@synthesize managedObjectContext;
@synthesize schedulearray;
@synthesize sectionheadersarray;
@synthesize sectionrowsarray;
@synthesize disablingView;
@synthesize myDeviceID;

- (NSArray *)schedulearray {
  if (!schedulearray) {
    self.schedulearray = [NSMutableArray array];
  }
  return schedulearray;
}


#pragma mark - View Lifecycle
- (void)viewDidLoad {
	[super viewDidLoad];
  
  tempSchedule = [[DBLScheduleInfo alloc]init];
  self.sectionheadersarray = [[NSMutableArray alloc]init];
  self.sectionrowsarray = [[NSMutableArray alloc]init];
  
  self.title = @"Schedule";
  self.navigationItem.title = @"Schedule";
  
  self.getLatestScheduleButton.title = @"Get Latest Schedule";
  self.navigationItem.rightBarButtonItem = self.getLatestScheduleButton;
  
  if (managedObjectContext == nil)
	{
    managedObjectContext = [(DBLAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
	}
  
  vcSelfTicket = [[SelfTicketController alloc]initWithPopoverSize:TICKET_WINDOW_SIZE];
  [vcSelfTicket setDelegate:self];
  myPopoverController = [[UIPopoverController alloc]initWithContentViewController:vcSelfTicket];
  [myPopoverController setPopoverContentSize:TICKET_WINDOW_SIZE];
  [myPopoverController setDelegate:self];
  
  [self fetchScheduleFromCoreData];
}

- (void)viewDidUnload {
  // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
  // For example: self.myOutlet = nil;
  self.getLatestScheduleButton = nil;
  self.spinner = nil;
	self.schedulearray = nil;
  self.disablingView = nil;
  hostReach = nil;
  [super viewDidUnload];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(updateScheduleTable)
                                               name:NOTIFICATION_reloadSchedule
                                             object:nil];
  
  [self updateScheduleTable];
}

- (void)viewWillDisappear:(BOOL)animated
{
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:NOTIFICATION_reloadSchedule
                                                object:nil];
  
  [super viewWillDisappear:animated];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  // Return YES for supported orientations.
  //return (interfaceOrientation == UIInterfaceOrientationPortrait);
  return YES;
}


#pragma mark - support methods

- (void)showPopup:(NSString *)message {
  UIAlertView *alert = [[UIAlertView alloc]
                        initWithTitle: @"Announcement"
                        message: message
                        delegate: nil
                        cancelButtonTitle:@"OK"
                        otherButtonTitles:nil];
  
  [alert show];
  [alert release];
}

- (void)handleError:(NSError *)error {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                  message:[error description]
                                                 delegate:nil
                                        cancelButtonTitle:@"OK"
                                        otherButtonTitles:nil];
  [alert show];
  [alert release];
}

- (void)showLoading {
  self.navigationItem.titleView = self.spinner;
  [self.spinner startAnimating];
}

- (void)hideLoading {
  [self.spinner stopAnimating];
  [self performSelector:@selector(stopLoading) withObject:nil afterDelay:0.0];
  self.navigationItem.titleView = nil;
}


- (void)fetchScheduleFromCoreData {
	NSManagedObjectContext *context = [self managedObjectContext];
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"DBLScheduleInfo"
                                            inManagedObjectContext:context];
	[fetchRequest setEntity:entity];
	
	NSSortDescriptor *sortByDate = [[NSSortDescriptor alloc] initWithKey:@"startTime" ascending:YES];
	[fetchRequest setSortDescriptors:[NSArray arrayWithObject:sortByDate]];
	[sortByDate release];
	
	NSError *error = nil;
	NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
	//NSLog(@"fetchedObjects count: %d",[fetchedObjects count]);
  
	for (DBLScheduleInfo *schedule in fetchedObjects) {
    [self addCoreDataScheduleToArray:schedule];
	}
  if (![managedObjectContext save:&error]) {
    // Handle the error.
    NSLog(@"Failed To Save Deleting Schedule Stores: %@", [error localizedDescription]);
  }
  else {
    NSLog(@"Successfully Deleted Schedule Stores");
  }
  
	[fetchRequest release];
}

/////////////////////////
#pragma mark -
#pragma mark Update Refresh Functions
/////////////////////////
- (void)refresh {
  [self performSelector:@selector(getLatestScheduleButtonClick:) withObject:nil afterDelay:0.0];
}

//add core data ticket to temporary array
- (void)addCoreDataScheduleToArray:(DBLScheduleInfo *)schedule {
	[self.schedulearray addObject:schedule];
}

//UI clicks refresh button
- (void)getLatestScheduleButtonClick:(id)sender
{
  [self showLoading];
  //delete core data//
  NSManagedObjectContext *context = [self managedObjectContext];
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"DBLScheduleInfo"
                                            inManagedObjectContext:context];
	[fetchRequest setEntity:entity];
	
	NSError *error = nil;
	NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
  
	for (DBLScheduleInfo *schedule in fetchedObjects) {
    [context deleteObject:schedule];
	}
  
  if (![managedObjectContext save:&error]) {
    // Handle the error.
    NSLog(@"Failed To Save Deleting Schedule Stores: %@", [error localizedDescription]);
  }
  else {
    NSLog(@"Successfully Deleted Schedule Stores");
  }
	[fetchRequest release];
  ////////////////////
  [self getScheduleFromWebService];
}

- (void)reloadScheduleData:(NSNotification*)notification
{
  [self updateScheduleTable];
}

- (void)updateScheduleTable {
	[self.schedulearray removeAllObjects];
	[self fetchScheduleFromCoreData];
	[self.tableView reloadData];
  [self hideLoading];
}

/////////////////////////
#pragma mark -
#pragma mark Web Service Interactions
/////////////////////////

- (void)getScheduleFromWebService {
  hostReach = [[Reachability reachabilityWithHostName: TICKETS_SERVICE_DOMAIN] retain];
  NetworkStatus remoteHostStatus = [hostReach currentReachabilityStatus];
  
  if (remoteHostStatus != NotReachable) {
    
    /////////////////////////////////
    //Gets Tickets From Web Service
    SDZTickets* service = [[SDZTickets alloc] init];
    [service GetSchedule:self
                  action:@selector(GetScheduleHandler:)
                deviceid:[APP_DELEGATE deviceId]
                    udid:[APP_DELEGATE UDID]];
    [service release];
  }
  
  else {
    UIAlertView *newAlert = [[UIAlertView alloc]initWithTitle:@"Cannot retrieve tickets" message:@"Make sure your internet connection is stable and try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [newAlert show];
    [newAlert release];
  }
}

- (void)StoreScheduleinCoreData:(id)sched
{
  SDZScheduleInfo* result = (SDZScheduleInfo*)sched;
  
  NSError *error = nil;
	
	//TRY AND READ DATA//
	NSManagedObjectContext *context = [self managedObjectContext];
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"DBLScheduleInfo"
                                            inManagedObjectContext:context];
	[fetchRequest setEntity:entity];
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"startTime = %@", [result StartTime]];
	[fetchRequest setPredicate:predicate];
	
	NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
  
	if ([fetchedObjects count] > 0) {
		//found a ticket with that ticket number
		//NSLog(@"Found Already Existing Ticket");
    
	}
	else {
		//did not find a ticket insert is ok to store record in core data
		//LOAD INTO CORE DATA//
		DBLScheduleInfo *event = (DBLScheduleInfo *)[NSEntityDescription insertNewObjectForEntityForName:@"DBLScheduleInfo"
                                                                              inManagedObjectContext:managedObjectContext];
    /////////////////////////
    [event setCustomerName:[result CustomerName]];
    [event setEndTime:[result EndTime]];
    [event setOrderID:[result OrderID]];
    [event setProductID:[result ProductID]];
    [event setQty:[result Qty]];
    [event setQtyType:[result QtyType]];
    [event setStartTime:[result StartTime]];
    [event setLocationCode:[NSNumber numberWithInt:[result LocationCode]]];
    [event setLocationName:[result LocationName]];
    [event setLatitude:[result Latitude]];
    [event setLongitude:[result Longitude]];
    [event setCompleted:[NSNumber numberWithBool:[result Completed]]];
    [event setAllowselfticket:[NSNumber numberWithBool:[result AllowSelfTicket]]];
    
		if (![managedObjectContext save:&error]) {
			// Handle the error.
			NSLog(@"Failed To Save New Schedule: %@", [error localizedDescription]);
		}
		else {
			//NSLog(@"Saved New Ticket");
		}
	}
	[fetchRequest release];
}

- (void) GetScheduleHandler: (id) value {
  
	// Handle errors
	if([value isKindOfClass:[NSError class]] || [value isKindOfClass:[SoapFault class]]) {
    NSLog(@"Get Schedule From Web Service Class Fault: %@", value);
    [self showPopup:@"Get Schedule Class Error.  Check Connection."];
    [self updateScheduleTable];
		return;
	}
  
  else if ([value isKindOfClass:[NSString class]]) {
    NSString *response = (NSString *) value;
    if ([response isEqualToString:SERVER_RESPONSE_FAILURE_VALUE]) {
      UIAlertView *newAlert = [[UIAlertView alloc]initWithTitle:FAILURE_ALERT_TITLE_SCHEDULE
                                                        message:FAILURE_ALERT_MESSAGE_SCHEDULE
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
      [newAlert show];
      [newAlert release];
    }
    
    else {
      NSLog(@"Error: schedule returned is not of type NSMutableArray");
      return;
    }
    
  }
  
  // Do something with the NSMutableArray* result
  NSMutableArray* result = (NSMutableArray*)value;
  
  if([result count]<=0)
  {
    [self showPopup:@"No Schedule Returned."];
  }
  
  for(SDZScheduleInfo* sched in result)
  {
    [self StoreScheduleinCoreData:sched];
  }
	[self updateScheduleTable];
}


/////////////////////////
#pragma mark -
#pragma mark Table view data source
/////////////////////////

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  if([self.schedulearray count] > 0)
  {
    [self.sectionrowsarray removeAllObjects];
    [self.sectionheadersarray removeAllObjects];
    
    NSString *comparedate = nil;
    int sectioncount = 0;
    int rowcount = 1;
    NSString *formattedDateString = nil;
    
    for (DBLScheduleInfo *sched in schedulearray)
    {
      NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
      [dateFormat setDateFormat:SERVICE_DATE_FORMAT];
      NSDate *date = [dateFormat dateFromString:[dateFormat stringFromDate:[sched startTime]]];
      [dateFormat setDateFormat:@"MM/dd/yyyy"];
      formattedDateString = [dateFormat stringFromDate:date];
      [dateFormat release];
      
      if ([formattedDateString isEqualToString:comparedate])
      {
        rowcount++;
      }
      else
      {
        if (comparedate == nil)
        {
          rowcount = 1;
        }
        else
        {
          [self.sectionrowsarray addObject:[NSNumber numberWithInteger:rowcount]];
          rowcount = 1;
          [self.sectionheadersarray addObject:comparedate];
          
        }
        comparedate = formattedDateString;
        sectioncount++;
      }
    }
    
    if(formattedDateString != nil)
    {
      [self.sectionheadersarray addObject:formattedDateString];
    }
    
    [self.sectionrowsarray addObject:[NSNumber numberWithInteger:rowcount]];
    return sectioncount;
  }
  else
  {
    return 0;
  }
  
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  if(section < [[self sectionheadersarray] count]) {
    return [self.sectionheadersarray objectAtIndex:section];
  } else {
    return @"Other Schedules";
  }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [[self.sectionrowsarray objectAtIndex:section] integerValue];
}

- (CGFloat)tableView:(UITableView *)table heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"DBLAssignmentCell";
	DBLAssignmentCell *cell = [table dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DBLAssignmentCell"
                                                 owner:self
                                               options:nil];
    
    cell = [nib objectAtIndex:0];
  }
  
  CGSize measureLabel;
  NSString *text;
  
  int arrayindex = 0;
  for (int n = 0; n < indexPath.section; n++)
  {
    arrayindex += [[self.sectionrowsarray objectAtIndex:n]integerValue];
  }
  arrayindex += indexPath.row;
  
  DBLScheduleInfo *schedule = [self.schedulearray objectAtIndex:arrayindex];
  if (schedule) {
      text = [schedule.locationName substringFromIndex:1];
    measureLabel = [text sizeWithFont:[UIFont boldSystemFontOfSize:23.0f] constrainedToSize:CGSizeMake(cell.infoView.frame.size.width-135, CGFLOAT_MAX) lineBreakMode:NSLineBreakByCharWrapping];
    
    text = schedule.productID;
    measureLabel.height = measureLabel.height + [text sizeWithFont:[UIFont systemFontOfSize:20.0f] constrainedToSize:CGSizeMake(cell.infoView.frame.size.width-97, CGFLOAT_MAX) lineBreakMode:NSLineBreakByCharWrapping].height;
    
    text = schedule.customerName;
    measureLabel.height = measureLabel.height + [text sizeWithFont:[UIFont systemFontOfSize:17.0f] constrainedToSize:CGSizeMake(cell.infoView.frame.size.width-96, CGFLOAT_MAX) lineBreakMode:NSLineBreakByCharWrapping].height;
    
    if (measureLabel.height+70 < 160) {
      return 160;
    }
    else {
      return measureLabel.height+70;
    }
  }

  else {
    return 160;
  }
}

- (UITableViewCell *)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  static NSString *CellIdentifier = @"DBLAssignmentCell";
	
	DBLAssignmentCell *cell = [table dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DBLAssignmentCell"
                                                 owner:self
                                               options:nil];
    
    cell = [nib objectAtIndex:0];
    [cell setDelegate:self];
  }
  
  for (UIView *subview in cell.infoView.subviews) {
    [subview removeFromSuperview];
  }
  
  int arrayindex = 0;
  for (int n = 0; n < indexPath.section; n++)
  {
    arrayindex += [[self.sectionrowsarray objectAtIndex:n]integerValue];
  }
  arrayindex += indexPath.row;
  
  DBLScheduleInfo *schedule = [self.schedulearray objectAtIndex:arrayindex];
  if (schedule)
  {
  
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:SERVICE_DATE_FORMAT];
    NSString *startTimeDateString = [dateFormat stringFromDate:[schedule startTime]];
    
    CGSize measureLabel;
    NSString *text;
    
    ////// topmost line
    
    UILabel *lblLocationHeader = [[UILabel alloc]init];
    [lblLocationHeader setText:@"Location: "];
    [lblLocationHeader setFont:[UIFont boldSystemFontOfSize:24.0f]];
    [lblLocationHeader sizeToFit];
    [lblLocationHeader setFrame:CGRectMake(0, 4, lblLocationHeader.frame.size.width, lblLocationHeader.frame.size.height)];
    
    UILabel *lblCapital = [[UILabel alloc]init];
    [lblCapital setText:[NSString stringWithFormat:@"%C", [schedule.locationName characterAtIndex:0]]];
    [lblCapital setFont:[UIFont boldSystemFontOfSize:27.0f]];
    [lblCapital sizeToFit];
    [lblCapital setFrame:CGRectMake(lblLocationHeader.frame.origin.x+lblLocationHeader.frame.size.width, 2, lblCapital.frame.size.width, lblCapital.frame.size.height)];
    
  text = [schedule.locationName substringFromIndex:1];
    
    UILabel *lblLocationText = [[UILabel alloc]init];
    [lblLocationText setText:text];
    [lblLocationText setFont:[UIFont boldSystemFontOfSize:23.0f]];
    [lblLocationText setNumberOfLines:0];
    [lblLocationText setBackgroundColor:[UIColor clearColor]];
    
    measureLabel = [text sizeWithFont:[UIFont boldSystemFontOfSize:23.0f] constrainedToSize:CGSizeMake(cell.infoView.frame.size.width-(lblCapital.frame.size.width+lblCapital.frame.origin.x), CGFLOAT_MAX) lineBreakMode:NSLineBreakByCharWrapping];
    
    [lblLocationText setFrame:CGRectMake(lblCapital.frame.size.width+lblCapital.frame.origin.x, 6, measureLabel.width, measureLabel.height)];
    
    
    /////
    
    UILabel *lblProductHeader = [[UILabel alloc]init];
    [lblProductHeader setText:@"Product: "];
    [lblProductHeader setFont:[UIFont boldSystemFontOfSize:22.0f]];
    [lblProductHeader sizeToFit];
    [lblProductHeader setFrame:CGRectMake(0, lblLocationText.frame.size.height+3, lblProductHeader.frame.size.width, lblProductHeader.frame.size.height)];
    
    text = schedule.productID;
    
    UILabel *lblProduct = [[UILabel alloc]init];
    [lblProduct setText:text];
    [lblProduct setFont:[UIFont systemFontOfSize:20.0f]];
    [lblProduct setNumberOfLines:0];
    [lblProduct setBackgroundColor:[UIColor clearColor]];
    
    measureLabel = [text sizeWithFont:[UIFont systemFontOfSize:20.0f] constrainedToSize:CGSizeMake(cell.infoView.frame.size.width-lblProductHeader.frame.size.width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByCharWrapping];
    [lblProduct setFrame:CGRectMake(lblProductHeader.frame.size.width, lblProductHeader.frame.origin.y, measureLabel.width, measureLabel.height)];

    /////
    
    UILabel *lblQtyHeader = [[UILabel alloc]init];
    [lblQtyHeader setText:@"Qty: "];
    [lblQtyHeader setFont:[UIFont boldSystemFontOfSize:18.0f]];
    [lblQtyHeader sizeToFit];
    [lblQtyHeader setFrame:CGRectMake(0, lblProduct.frame.origin.y+lblProduct.frame.size.height, lblQtyHeader.frame.size.width, lblQtyHeader.frame.size.height)];
    
    UILabel *lblQty = [[UILabel alloc]init];
    [lblQty setText:[NSString stringWithFormat:@"%@ %@", schedule.qty, schedule.qtyType]];
    [lblQty setFont:[UIFont systemFontOfSize:17.0f]];
    [lblQty sizeToFit];
    [lblQty setFrame:CGRectMake(lblQtyHeader.frame.size.width, lblQtyHeader.frame.origin.y, lblQty.frame.size.width, lblQty.frame.size.height)];
    
    /////
    
    
    UILabel *lblTimeHeader = [[UILabel alloc]init];
    [lblTimeHeader setText:@"Time: "];
    [lblTimeHeader setFont:[UIFont boldSystemFontOfSize:18.0f]];
    [lblTimeHeader sizeToFit];
    [lblTimeHeader setFrame:CGRectMake(0, lblQtyHeader.frame.size.height+lblQtyHeader.frame.origin.y, lblTimeHeader.frame.size.width, lblTimeHeader.frame.size.height)];
    
    UILabel *lblTime = [[UILabel alloc]init];
    [lblTime setText:startTimeDateString];
    [lblTime setFont:[UIFont systemFontOfSize:17.0f]];
    [lblTime sizeToFit];
    [lblTime setFrame:CGRectMake(lblTimeHeader.frame.size.width+lblTimeHeader.frame.origin.x, lblTimeHeader.frame.origin.y, lblTime.frame.size.width, lblTime.frame.size.height)];
    
    
    /////
    
    UILabel *lblCustomerHeader = [[UILabel alloc]init];
    [lblCustomerHeader setText:@"Customer: "];
    [lblCustomerHeader setFont:[UIFont boldSystemFontOfSize:18.0f]];
    [lblCustomerHeader sizeToFit];
    [lblCustomerHeader setFrame:CGRectMake(0, lblTimeHeader.frame.size.height+lblTimeHeader.frame.origin.y, lblCustomerHeader.frame.size.width, lblCustomerHeader.frame.size.height)];
    
    text = schedule.customerName;
    
    measureLabel = [text sizeWithFont:[UIFont systemFontOfSize:17.0f] constrainedToSize:CGSizeMake(cell.infoView.frame.size.width-lblCustomerHeader.frame.size.width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByCharWrapping];
    
    UILabel *lblCustomer = [[UILabel alloc]init];
    [lblCustomer setText:text];
    [lblCustomer setFont:[UIFont systemFontOfSize:17.0f]];
    [lblCustomer setNumberOfLines:0];
    [lblCustomer setFrame:CGRectMake(lblCustomerHeader.frame.size.width, lblCustomerHeader.frame.origin.y, measureLabel.width, measureLabel.height)];
    
    //////
    
    UILabel *lblOrderIDHeader = [[UILabel alloc]init];
    [lblOrderIDHeader setText:@"Order ID: "];
    [lblOrderIDHeader setFont:[UIFont boldSystemFontOfSize:18.0f]];
    [lblOrderIDHeader sizeToFit];
    [lblOrderIDHeader setFrame:CGRectMake(0, lblCustomer.frame.size.height+lblCustomer.frame.origin.y, lblOrderIDHeader.frame.size.width, lblOrderIDHeader.frame.size.height)];
    
    UILabel *lblOrderID = [[UILabel alloc]init];
    [lblOrderID setText:schedule.orderID];
    [lblOrderID setFont:[UIFont systemFontOfSize:17.0f]];
    [lblOrderID sizeToFit];
    [lblOrderID setFrame:CGRectMake(lblOrderIDHeader.frame.size.width, lblOrderIDHeader.frame.origin.y, lblOrderID.frame.size.width, lblOrderID.frame.size.height)];
    
    [cell.infoView addSubview:lblLocationHeader];
    [cell.infoView addSubview:lblCapital];
    [cell.infoView addSubview:lblLocationText];
    
    [cell.infoView addSubview:lblProductHeader];
    [cell.infoView addSubview:lblProduct];
    
    [cell.infoView addSubview:lblQtyHeader];
    [cell.infoView addSubview:lblQty];
    
    [cell.infoView addSubview:lblCustomerHeader];
    [cell.infoView addSubview:lblCustomer];
    
    [cell.infoView addSubview:lblOrderIDHeader];
    [cell.infoView addSubview:lblOrderID];
    
    [cell.infoView addSubview:lblTimeHeader];
    [cell.infoView addSubview:lblTime];
    
    [cell setSchedule:schedule];
    [cell setCompleted:[(NSNumber*)[schedule valueForKey:@"completed"] boolValue]];
    
    [lblOrderID release];
    [lblOrderIDHeader release];
    [lblLocationText release];
    [lblLocationHeader release];
    [lblCustomer release];
    [lblCustomerHeader release];
    [lblProduct release];
    [lblProductHeader release];
    [lblQty release];
    [lblQtyHeader release];
    [lblTime release];
    [lblTimeHeader release];
    [lblCapital release];
    [dateFormat release];
  
  }
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  DBLMapViewController *tVC = [[DBLMapViewController alloc] initWithNibName:@"DBLMapView" bundle:[NSBundle mainBundle]];
  
  DBLScheduleInfo *schedule = [self.schedulearray objectAtIndex:indexPath.row];
  
  CLLocationCoordinate2D temp;
  if([[schedule latitude] doubleValue] == 0) {
    [self showPopup:@"No GPS Coordinates for Selected Schedule Item"];
  }
  else {
    temp.latitude = [[schedule latitude] doubleValue];
    temp.longitude = [[schedule longitude] doubleValue];
    tVC.ll1 = temp;
  }
	
  tVC.navigationItem.title = @"Map View";
  
  [self.navigationController pushViewController:tVC animated:YES];
  [tVC release];
}

-(void)clickedSelfTicket:(DBLScheduleInfo*)schedule {
  tempSchedule = schedule;
  [myPopoverController presentPopoverFromBarButtonItem:self.getLatestScheduleButton permittedArrowDirections:0 animated:YES];
}

-(void)didRequestTicket {
  if ([vcSelfTicket emptyFields]) {
    UIAlertView *newAlert = [[UIAlertView alloc]initWithTitle:@"One or more fields are empty." message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [newAlert show];
    [newAlert release];
  }
  else {
    UIAlertView *newAlert = [[UIAlertView alloc]initWithTitle:@"Is this correct?" message:[NSString stringWithFormat:@"Requested ticket: %0.2f %@", [vcSelfTicket getAmount], [vcSelfTicket getUnitType]] delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    [newAlert setTag:ALERT_SCHEDULE_CONFIRM_TICKET];
    [newAlert show];
    [newAlert release];
  }
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
  if (alertView.tag == ALERT_SCHEDULE_CONFIRM_TICKET) {
    [myPopoverController dismissPopoverAnimated:YES];
    if (buttonIndex == 1) {
      
      if (tempSchedule.locationCode == 0 || [tempSchedule.orderID isEqualToString:@""] || [tempSchedule.customerName isEqualToString:@""]) {
        UIAlertView *newAlert = [[UIAlertView alloc]initWithTitle:@"Problem sending request" message:@"An error occurred while sending your request. Please try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [newAlert show];
        [newAlert release];
      }
      else {
      
      CLLocation *locationToSend = [[DBLCLController sharedCLController] lastLocation];
      SDZTickets *service = [[SDZTickets alloc]init];
      [service setLogging:YES];
      
      [service TicketAssignment:self action:@selector(ticketHandler:)
                       deviceid:[APP_DELEGATE deviceId] udid:[APP_DELEGATE UDID]
                      timestamp:[NSDate date]
                       latitude:[NSString stringWithFormat:@"%f", [locationToSend coordinate].latitude]
                      longitude:[NSString stringWithFormat:@"%f", [locationToSend coordinate].longitude]
                   locationcode:[tempSchedule.locationCode intValue]
                      productid:tempSchedule.productID
                        orderid:tempSchedule.orderID
                   customername:tempSchedule.customerName
                         amount:[[NSDecimalNumber alloc]initWithDouble:[vcSelfTicket getAmount]]
                           type:[vcSelfTicket getUnitType]];
      }
      }
  }
}

-(void)ticketHandler: (id)value {
  if([value isKindOfClass:[NSError class]] || [value isKindOfClass:[SoapFault class]]) {
    NSLog(@"self-ticket error: %@", (NSString*) value);
  }
  
  else {
    SDZTicketResponse* response = (SDZTicketResponse*)value;
    
    if (response.Success) {
      [self storeTicketInCoreData:response.Ticket];
      UIAlertView *newAlert = [[UIAlertView alloc]initWithTitle:@"Self-Ticket Request Sent!" message:response.Message delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
      [newAlert show];
      [newAlert release];
    }
    
    else {
      UIAlertView *newAlert = [[UIAlertView alloc]initWithTitle:@"Self-Ticket Request denied." message:response.Message delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
      [newAlert show];
      [newAlert release];
    }
  }
}

- (void)storeTicketInCoreData:(id)tkt
{
  SDZTicket* result = (SDZTicket*)tkt;
  
  NSError *error = nil;
	
	//TRY AND READ DATA//
	NSManagedObjectContext *context = [APP_DELEGATE managedObjectContext];
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"DBLTicket"
                                            inManagedObjectContext:context];
	[fetchRequest setEntity:entity];
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"ticketNumber = %@", result.TicketNumber];
	[fetchRequest setPredicate:predicate];
	
	NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
	
  DBLTicket *event = nil;
	if ([fetchedObjects count] > 0) {
    event = [fetchedObjects objectAtIndex:0];
	}
	else {
		event = [NSEntityDescription insertNewObjectForEntityForName:@"DBLTicket"
                                          inManagedObjectContext:context];
  }
  
  /////////////////////////
  event.addressID = [NSNumber numberWithInt:result.AddressID];
  event.copyString = result.Copy;
  event.customerAccountNumber = result.CustomerAcctNumber;
  event.customerAddress = result.CustomerAddress;
  event.deliveryInstructions = result.DeliveryInstructions;
  event.fuelSurcharge = result.FuelSurcharge;
  event.grossWeight = result.GrossWt;
  event.haulCharge = result.HaulCharge;
  event.haulIndicator = result.HaulIndicator;
  event.haulRate = result.HaulRate;
  event.haulerName = result.HaulerName;
  event.haulerNumber = result.HaulerNumber;
  event.jobContractor = result.JobContact;
  event.jobPhone = result.JobPhone;
  event.locationName = result.LocationName;
  event.locationCode = [NSNumber numberWithInt:result.LocationCode];
  event.latitude = result.Latitude;
  event.longitude = result.Longitude;
  event.lotSample = result.LotSample;
  event.maxGross = result.MaxGross;
  event.metricTonsLoadsToday = result.MetricTonsLoadsToday;
  event.metricTonsQtyDelivered = result.MetricTonsQtyDelivered;
  event.metricTonsQtyDeliveryToday = result.MetricTonsQtyDeliveryToday;
  event.metricTonsQtyOrdered = result.MetricTonsQtyOrdered;
  event.netTons = result.NetTons;
  event.netTonsMetric = result.NetTonsMetric;
  event.netWeight = result.NetWeight;
  event.orderID = result.OrderID;
  event.plant = result.Plant;
  event.productCertification = result.ProductCertification;
  event.productCertificationDefault = result.ProductCertificationDefault;
  event.productCode = result.ProductCode;
  event.productDescription = result.ProductDescription;
  event.projectDescription = result.ProjectDescription;
  event.projectID = result.ProjectID;
  event.purchaseOrder = result.PurchaseOrder;
  event.salesTax = result.SalesTax;
  event.shortTonsLoadsToday = result.ShortTonsLoadsToday;
  event.shortTonsQtyDelivered = result.ShortTonsQtyDelivered;
  event.shortTonsQtyDeliveryToday = result.ShortTonsQtyDeliveryToday;
  event.shortTonsQtyOrdered = result.ShortTonsQtyOrdered;
  event.specialInstructions = result.SpecialInstructions;
  event.stonePrice = result.StonePrice;
  event.stoneRate = result.StoneRate;
  event.tareWeight = result.TareWt;
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:SERVICE_DATE_FORMAT];
  event.ticketDate = [dateFormatter stringFromDate:result._TicketDateTime];
  [dateFormatter release];
  event.ticketNumber = result.TicketNumber;
  event.ticketTime = result.TicketTime;
  event.total = result.Total;
  event.truckNumber = result.TruckNumber;
  event.warning1 = result.Warning1;
  event.warning2 = result.Warning2;
  event.weighmaster = result.Weighmaster;
  
  event.notes=result.Notes;
  
  if(result.Signature1) {
    //result.Signature is data of a base64 encoded string. (Convert it to a String the put it back into data)
    NSString *signatureResult = [[NSString alloc] initWithData:result.Signature1
                                                      encoding:NSUTF8StringEncoding];
    
    NSData *signatureData = [[NSData alloc] initWithBase64EncodedString:signatureResult];
    event.signature1 = signatureData;
    [signatureData release];
    [signatureResult release];
  }
  //added for signature data - Qfor - gowri - July 18, 2013
  
  if(result.Signature2) {
    //result.Signature is data of a base64 encoded string. (Convert it to a String the put it back into data)
    NSString *signatureResult = [[NSString alloc] initWithData:result.Signature2
                                                      encoding:NSUTF8StringEncoding];
    
    NSData *signatureData = [[NSData alloc] initWithBase64EncodedString:signatureResult];
    event.signature2 = signatureData;
    [signatureData release];
    [signatureResult release];
  }
  
  if(result.Signature3) {
    //result.Signature is data of a base64 encoded string. (Convert it to a String the put it back into data)
    NSString *signatureResult = [[NSString alloc] initWithData:result.Signature3
                                                      encoding:NSUTF8StringEncoding];
    
    NSData *signatureData = [[NSData alloc] initWithBase64EncodedString:signatureResult];
    event.signature3 = signatureData;
    [signatureData release];
    [signatureResult release];
  }
  
  if(result.Signature4) {
    //result.Signature is data of a base64 encoded string. (Convert it to a String the put it back into data)
    NSString *signatureResult = [[NSString alloc] initWithData:result.Signature4
                                                      encoding:NSUTF8StringEncoding];
    
    NSData *signatureData = [[NSData alloc] initWithBase64EncodedString:signatureResult];
    event.signature4 = signatureData;
    [signatureData release];
    [signatureResult release];
  }
  
  
  if (![context save:&error]) {
    // Handle the error.
    NSLog(@"Failed To Save New Ticket: %@", [error localizedDescription]);
  }
  else {
    //NSLog(@"Saved New Ticket");
  }
  
  [fetchRequest release];
}

/////////////////////////
#pragma mark -
#pragma mark Memory Management
/////////////////////////
- (void)didReceiveMemoryWarning {
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)dealloc {
  [getLatestScheduleButton release];
  [spinner release];
	[schedulearray release];
  [super dealloc];
}


@end
