//
//  NBCAnnouncementViewController.m
//  Northminster
//
//  Created by Kiere El-Shafie on 2/12/11.
//  Copyright 2011 lazyGray, Inc. All rights reserved.
//

#import "DBLTicketViewController.h"
#import "DBLCLController.h"
#import "NSData+Base64.h"
#import "DBLDeliveredViewController.h"
#import "DBLSignatureLocal.h"
#import "DBLTicket.h"
#import "DBLSignatureManager.h"

@interface DBLTicketViewController ()

- (void)loadTicket;
- (void)showLoading;
- (void)hideLoading;
- (void)showPopup:(NSString *)message;
- (void)loadTicketValues;

//notifications
- (void)updateTicket:(NSNotification*)notification;

@end

@implementation AutographViewController

@synthesize myAutograph;
@synthesize clearBtn;
@synthesize cancelBtn;
@synthesize doneBtn;
@synthesize spacer;
@synthesize tools;
@synthesize blank;
@synthesize disclaimer;
@synthesize delegate;

-(id)initWithViewWidth:(CGFloat)viewWidth andViewHeight:(CGFloat)viewHeight {
  [super init];
  
  self.myAutograph = [[T1Autograph alloc]init];
  
  self.blank = [[UIView alloc]initWithFrame:CGRectMake(0, 44, viewWidth, viewHeight)];
  [self.blank setBackgroundColor:[UIColor clearColor]];
  
  self.disclaimer = [[UILabel alloc]initWithFrame:CGRectMake(25, 5, viewWidth-50, 100)];
  [self.disclaimer setText:@"Delivery is quoted to the curb line.  Customer assumes responsibility for any damages beyond that point.  At the plant of origin, Luck Stone warrants material conforms to applicable specifications as noted under the Product Description of this document."];
  [self.disclaimer setTextAlignment:NSTextAlignmentCenter];
  [self.disclaimer setFont:[UIFont boldSystemFontOfSize:18.0f]];
  [self.disclaimer setNumberOfLines:0];
  [self.disclaimer setTextColor:[UIColor redColor]];
  
  [self.blank addSubview:self.disclaimer];
  
  self.tools = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, viewWidth, 44)];
  
  self.clearBtn = [[UIBarButtonItem alloc]initWithTitle:@"Clear" style:UIBarButtonItemStyleBordered target:self action:@selector(clearClick)];
  self.cancelBtn = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelClick)];
  
  self.spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
  self.doneBtn  = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonItemStylePlain target:self action:@selector(doneClick)];
  
  [tools setItems:[NSArray arrayWithObjects:self.cancelBtn, self.clearBtn,spacer,doneBtn, nil]];
  
  [self.view addSubview:tools];
  [self.view addSubview:blank];
  
  return self;
}

-(void)viewDidUnload {
  [super viewDidUnload];
  [disclaimer release];
  [cancelBtn release];
  [clearBtn release];
  [spacer release];
  [doneBtn release];
  [tools release];
  [blank release];
  [myAutograph release];
}

-(void) doneClick {
  [self.delegate didClickDone];
  
  [self.myAutograph done:self];
	[self.myAutograph reset:self];
}

-(void) clearClick {
  	[self.myAutograph reset:self];
}

-(void) cancelClick {
  [self.myAutograph reset:self];
  [self.delegate didClickCancel];
}

@end


@implementation DBLTicketViewController
@synthesize deliverButton;

@synthesize ticket, spinner, goToMapButton, signatureButton, autographModal, managedObjectContext;
@synthesize autographVC;

@synthesize customerAcctNumber, customerAddress, deliveryInstructions, fuelSurcharge, grossWt, haulCharge, haulRate, haulerName, haulerNumber, jobContact;
@synthesize jobPhone, lotSample, maxGross, metricTonsLoadsToday, metricTonsQtyDelivered, metricTonsQtyDeliveryToday, metricTonsQtyOrdered, netTons;
@synthesize netTonsMetric, netWeight, orderID, plant, productCertification, productCertificationDefault, productCode, productDecscription, projectDescription;
@synthesize projectID, purchaseOrder, salesTax, shortTonsLoadsToday, shortTonsQtyDelivered, shortTonsQtyDeliveryToday, shortTonsQtyOrdered, specialInstructions;
@synthesize stonePrice, stoneRate, tareWt, ticketDate, ticketNumber, ticketTime, total, truckNumber, warning1, warning2, weightMaster;

@synthesize signatureImageView;

@synthesize deliverPopover, emailPopover, popControl;


- (void)loadTicket {
	[self showLoading];
	[self loadTicketValues];
}


/////////////////////////
#pragma mark -
#pragma mark View lifecycle
/////////////////////////

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.goToMapButton setTitle:@"Go To Map"];
  [self.signatureButton setTitle:@"Get Signature"];
  [self.sendAsEmail setTitle:@"Email Ticket"];
  
  NSArray *rightBarButtons = [[NSArray alloc]initWithObjects:self.deliverButton, self.goToMapButton, self.signatureButton, self.sendAsEmail, nil];
  [self.navigationItem setRightBarButtonItems:rightBarButtons];
  
  //Setup the view controller for our popover
  emailPopover = [[DBLEmailPopoverViewController alloc]init];
  emailPopover.delegate = self;
  deliverPopover = [[DBLDeliveredViewController alloc]init];
  deliverPopover.delegate = self;
//  popControl = [[UIPopoverController alloc]initWithContentViewController:myPopover];
//  [popControl setPopoverContentSize:CGSizeMake(340,110)];
  popControl = [[UIPopoverController alloc]initWithContentViewController:emailPopover];
  
  ////////////////////////////////////
  if (managedObjectContext == nil) 
  { 
    [self setManagedObjectContext:[APP_DELEGATE managedObjectContext]]; 
  }
  
  [self loadTicket];
  
  self.email = [[NSString alloc]init];
}

- (void)viewDidUnload {
  //ticket properties release
	//self.copy = nil;
	self.customerAcctNumber = nil;
	self.customerAddress = nil;
	self.deliveryInstructions = nil;
	self.fuelSurcharge = nil;
	self.grossWt = nil;
	self.haulCharge = nil;
	self.haulRate = nil;
	self.haulerName = nil;
	self.haulerNumber = nil;
	self.jobContact = nil;
	self.jobPhone = nil;
	self.lotSample = nil;
	self.maxGross = nil;
	self.metricTonsLoadsToday = nil;
	self.metricTonsQtyDelivered = nil;
	self.metricTonsQtyDeliveryToday = nil;
	self.metricTonsQtyOrdered = nil;
	self.netTons = nil;
	self.netTonsMetric = nil;
	self.netWeight = nil;
	self.orderID = nil;
	self.plant = nil;
	self.productCertification = nil;
	self.productCertificationDefault = nil;
	self.productCode = nil;
	self.productDecscription = nil;
	self.projectDescription = nil;
	self.projectID = nil;
	self.purchaseOrder = nil;
	self.salesTax = nil;
	self.shortTonsLoadsToday = nil;
	self.shortTonsQtyDelivered = nil;
	self.shortTonsQtyDeliveryToday = nil;
	self.shortTonsQtyOrdered = nil;
	self.specialInstructions = nil;
	self.stonePrice = nil;
	self.stoneRate = nil;
	self.tareWt = nil;
	self.ticketDate = nil;
	self.ticketNumber = nil;
	self.ticketTime = nil;
	self.total = nil;
	self.truckNumber = nil;
	self.warning1 = nil;
	self.warning2 = nil;
	self.weightMaster = nil;
  
  self.goToMapButton = nil;
  self.signatureButton = nil;
  self.signatureImageView = nil;
  self.managedObjectContext = nil;
  
  [self setDeliverButton:nil];
    [self setSendAsEmail:nil];
  [super viewDidUnload];
}


- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(updateTicket:) 
                                               name:NOTIFICATION_updateTicket
                                             object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
  [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                  name:NOTIFICATION_updateTicket
                                                object:nil];
  
  [super viewWillDisappear:animated];
  
  if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
    [self dismissPopovers];
  }
}

/////////////////////////
#pragma mark -
#pragma mark Object lifecycle
/////////////////////////

- (void)dealloc {
	//ticket properties release
	//[copy release];
	[customerAcctNumber release];
	[customerAddress release];
	[deliveryInstructions release];
	[fuelSurcharge release];
	[grossWt release];
	[haulCharge release];
	[haulRate release];
	[haulerName release];
	[haulerNumber release];
	[jobContact release];
	[jobPhone release];
	[lotSample release];
	[maxGross release];
	[metricTonsLoadsToday release];
	[metricTonsQtyDelivered release];
	[metricTonsQtyDeliveryToday release];
	[metricTonsQtyOrdered release];
	[netTons release];
	[netTonsMetric release];
	[netWeight release];
	[orderID release];
	[plant release];
	[productCertification release];
	[productCertificationDefault release];
	[productCode release];
	[productDecscription release];
	[projectDescription release];
	[projectID release];
	[purchaseOrder release];
	[salesTax release];
	[shortTonsLoadsToday release];
	[shortTonsQtyDelivered release];
	[shortTonsQtyDeliveryToday release];
	[shortTonsQtyOrdered release];
	[specialInstructions release];
	[stonePrice release];
	[stoneRate release];
	[tareWt release];
	[ticketDate release];
	[ticketNumber release];
	[ticketTime release];
	[total release];
	[truckNumber release];
	[warning1 release];
	[warning2 release];
	[weightMaster release];
  
	//user interaction releases
	[ticket release];
  [goToMapButton release];
  [signatureButton release];
  [signatureImageView release];
  [managedObjectContext release];
  
  [deliverButton release];
    [_sendAsEmail release];
  [super dealloc];
}

-(void)dismissPopovers {
  [self.popControl dismissPopoverAnimated:YES];
}


- (void)getSignatureClick
{
  //Manually call T1Autograph instead of modal transition due to library errors
  
  self.autographVC = [[AutographViewController alloc]initWithViewWidth:SIGNATURE_WINDOW_WIDTH andViewHeight:SIGNATURE_WINDOW_HEIGHT];
  self.autographVC.delegate = self;
  [self.autographVC.view setBackgroundColor:[UIColor whiteColor]];
  
  [self.popControl setContentViewController:self.autographVC];
  [self.popControl setPopoverContentSize:CGSizeMake(SIGNATURE_WINDOW_WIDTH, SIGNATURE_WINDOW_HEIGHT)];
  [self.popControl presentPopoverFromBarButtonItem:self.signatureButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
  
  [self.autographVC setMyAutograph:[T1Autograph autographWithView:self.autographVC.blank delegate:self]];
  
  [self.autographVC.myAutograph setLicenseCode:@"3b5cb10eed222d83ee8c1ce5b2cd2c5f830e447f"];
  [self.autographVC.myAutograph setShowDate:YES];
  [self.autographVC.myAutograph setStrokeColor:[UIColor blackColor]];
  [self.autographVC.myAutograph setShowGuideline:YES];
  
  [autographVC release];
}

-(void)didClickDone {
  [self.popControl dismissPopoverAnimated:YES];
}

-(void)didClickCancel {
  [self.popControl dismissPopoverAnimated:YES];
}

- (IBAction)deliverButtonClick:(id)sender {
  [deliverPopover setTicket:self.ticket];
  [self.popControl setContentViewController:deliverPopover];
  [popControl setPopoverContentSize:CGSizeMake(540, 219)];
  [self.popControl presentPopoverFromBarButtonItem:self.deliverButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (IBAction)sendAsEmailClick:(id)sender {
  [self.popControl setContentViewController:emailPopover];
  [self.popControl setPopoverContentSize:CGSizeMake(340, 110)];
  
  [self.popControl presentPopoverFromBarButtonItem:self.sendAsEmail permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

-(void)didDismissModalView {
	NSLog(@"Autograph modal signature has been cancelled");
}

-(void)autographDidCompleteWithNoData {
	NSLog(@"User pressed the done button without signing");
}

#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
-(void)autographDidCompleteWithImageData:(NSData *)imageData hashValue:(NSString *)hashValue {
	//store signature file here//
  
  NSLog(@"Autograph modal signature completed.");
	if ([hashValue length]>0) {
		NSLog(@"Hash value: %@",hashValue);
    
	}
  
  //Add signature image to display
  if(signatureImageView != nil) {
    [signatureImageView removeFromSuperview];
  }
  
  UIImage *signatureImage = [UIImage imageWithData:imageData];
  signatureImageView = [[UIImageView alloc] initWithImage:signatureImage];
  
  CGRect signatureImageViewFrame = CGRectMake(150, (903-signatureImage.size.height), signatureImage.size.width, signatureImage.size.height);
  [signatureImageView setFrame:signatureImageViewFrame];
  
  [[self view] addSubview:signatureImageView];
  
  //store image data to coredata//
  
  //get most recent ticket and assign lat long//
  NSManagedObjectContext *context = [APP_DELEGATE managedObjectContext];
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:@"DBLTicket" 
                                            inManagedObjectContext:context];
  [fetchRequest setEntity:entity];
  [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"ticketNumber == %@", [ticket ticketNumber]]];
  
  [fetchRequest setFetchLimit:1];
  
  NSError *error = nil;
  NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
  for (DBLTicket *fetchedTicket in fetchedObjects) {
    fetchedTicket.signature = imageData;
    if (![context save:&error]) {
      // Handle the error.
      NSLog(@"Failed To Save New Ticket: %@", [error localizedDescription]);
    }
  }
  
  //try and send data to corporate//
  NSString *latitude = [[NSString alloc] initWithFormat:@"%g", [DBLCLController sharedCLController].locationManager.location.coordinate.latitude];
  NSString *longitude = [[NSString alloc] initWithFormat:@"%g", [DBLCLController sharedCLController].locationManager.location.coordinate.longitude];

  
  //////////////////////////////////////////
  //STORE SIGNATURE LOCALLY//
  DBLSignatureLocal *insertedSignature = [NSEntityDescription
                                     insertNewObjectForEntityForName:@"DBLSignatureLocal" 
                                     inManagedObjectContext:context];
  
  [insertedSignature setLatitude:latitude];
  [insertedSignature setLongitude:longitude];
  [insertedSignature setTicketNumber:[ticket ticketNumber]];
  [insertedSignature setTruckNumber:[ticket truckNumber]];
  [insertedSignature setLocationCode:[NSNumber numberWithInt:[[ticket locationCode] intValue]]];
  [insertedSignature setSignatureData:imageData];
  [insertedSignature setTimestamp:[NSDate date]];
  [insertedSignature setSentToCorporate:[NSNumber numberWithBool:NO]];
  
  
  if (![context save:&error]) {
    NSLog(@"Failed To Save Location Locally: %@", [error localizedDescription]);
    [self showPopup:@"Failed to Save Signature Locally."];
  }
  else {
    //NSLog(@"Saved Location Locally.  Time Stamp: %@", newLocation.timestamp);
    NSLog(@"Saved Location Locally.");
  }
  
  [latitude release];
  [longitude release];
  [fetchRequest release];
  
  [[APP_DELEGATE signatureManager] sendSignatureToCorporate:insertedSignature];  
}


- (void)goToMapButtonClick
{
  [self.popControl dismissPopoverAnimated:YES];
  
  DBLMapViewController *tVC = [[DBLMapViewController alloc] initWithNibName:@"DBLMapView" bundle:[NSBundle mainBundle]];
  
  CLLocationCoordinate2D temp;
  if([[ticket latitude] doubleValue] == 0)
  {
    
    [self showPopup:@"No GPS Coordinates for Selected Ticket"];
  }
  else
  {
    temp.latitude = [[ticket latitude] doubleValue];
    temp.longitude = [[ticket longitude] doubleValue];
    tVC.ll1 = temp;
  }
  
  
  tVC.navigationItem.title = @"Map View";
  
  [self.navigationController pushViewController:tVC animated:YES];
  [tVC release];
  
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  // Return YES for supported orientations.
  //return (interfaceOrientation == UIInterfaceOrientationPortrait);
  return YES;
}


- (void)didReceiveMemoryWarning {
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc. that aren't in use.
}

-(void)updateTicket:(NSNotification *)notification
{
  [self loadTicketValues];
}

// Handle the response from GetTicket.
- (void)loadTicketValues {
	
	NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
	[formatter setNumberStyle: NSNumberFormatterDecimalStyle];
	[formatter setMaximumFractionDigits:2];
	
	//NSLog(@"Ticket Number Is Now: %d",ticket.TicketNumber);
	//self.copy.text = ticket.Copy;
	self.customerAcctNumber.text = [[self ticket] customerAccountNumber];
	self.customerAddress.text = [[self ticket] customerAddress];
	self.deliveryInstructions.text = [[self ticket] deliveryInstructions];
	self.fuelSurcharge.text = [formatter stringFromNumber: [[self ticket] fuelSurcharge]];
	self.grossWt.text = [formatter stringFromNumber: [[self ticket] grossWeight]];
	self.haulCharge.text = [formatter stringFromNumber: [[self ticket] haulCharge]];
	self.haulRate.text = [formatter stringFromNumber: [[self ticket] haulRate]];
	self.haulerName.text = [[self ticket] haulerName];
	self.haulerNumber.text = [[self ticket] haulerNumber];
	self.jobContact.text = [[self ticket] jobContractor];
	self.jobPhone.text = [[self ticket] jobPhone];
	self.lotSample.text = [[self ticket] lotSample];
	self.maxGross.text = [formatter stringFromNumber: [[self ticket] maxGross]];
	self.metricTonsLoadsToday.text = [formatter stringFromNumber: [[self ticket] metricTonsLoadsToday]];
	self.metricTonsQtyDelivered.text = [formatter stringFromNumber: [[self ticket] metricTonsQtyDelivered]];
	self.metricTonsQtyDeliveryToday.text = [formatter stringFromNumber: [[self ticket] metricTonsQtyDeliveryToday]];
	self.metricTonsQtyOrdered.text = [formatter stringFromNumber: [[self ticket] metricTonsQtyOrdered]];
	self.netTons.text = [formatter stringFromNumber: [[self ticket] netTons]];
	self.netTonsMetric.text = [formatter stringFromNumber: [[self ticket] netTonsMetric]];
	self.netWeight.text = [formatter stringFromNumber: [[self ticket] netWeight]];
	self.orderID.text = [[self ticket] orderID];
	self.plant.text = [[self ticket] plant];
	self.productCertification.text = [[self ticket] productCertification];
	self.productCertificationDefault.text = [[self ticket] productCertificationDefault];
	self.productCode.text = [[self ticket] productCode];
	self.productDecscription.text = [[self ticket] productDescription];
	self.projectDescription.text = [[self ticket] projectDescription];
	self.projectID.text = [[self ticket] projectID];
	self.purchaseOrder.text = [[self ticket] purchaseOrder];
	self.salesTax.text = [formatter stringFromNumber: [[self ticket] salesTax]];
	self.shortTonsLoadsToday.text = [formatter stringFromNumber: [[self ticket] shortTonsLoadsToday]];
	self.shortTonsQtyDelivered.text = [formatter stringFromNumber: [[self ticket] shortTonsQtyDelivered]];
	self.shortTonsQtyDeliveryToday.text = [formatter stringFromNumber: [[self ticket] shortTonsQtyDeliveryToday]];
	self.shortTonsQtyOrdered.text = [formatter stringFromNumber: [[self ticket] shortTonsQtyOrdered]];
	self.specialInstructions.text = [[self ticket] specialInstructions];
	self.stonePrice.text = [formatter stringFromNumber: [[self ticket] stonePrice]];
	self.stoneRate.text = [formatter stringFromNumber: [[self ticket] stoneRate]];
	self.tareWt.text = [formatter stringFromNumber: [[self ticket] tareWeight]];
	self.ticketDate.text = [[self ticket] ticketDate];
	self.ticketNumber.text = [[self ticket] ticketNumber];
	self.ticketTime.text = [[self ticket] ticketTime];
	self.total.text = [formatter stringFromNumber: [[self ticket] total]];
	self.truckNumber.text = [[self ticket] truckNumber];
	self.warning1.text = [[self ticket] warning1];
	self.warning2.text = [[self ticket] warning2];
	self.weightMaster.text = [[self ticket] weighmaster];
  
  //SHOW SIGNATURE//
  //////////////////
  //Add signature image to display
  if(signatureImageView != nil) {
    [signatureImageView removeFromSuperview];
  }
  
  NSData *signatureData = [[self ticket] signature];
  UIImage *signatureImage = [UIImage imageWithData:signatureData];
  signatureImageView = [[UIImageView alloc] initWithImage:signatureImage];
  
  CGRect signatureImageViewFrame = CGRectMake(150, (903-signatureImage.size.height), signatureImage.size.width, signatureImage.size.height);
  [signatureImageView setFrame:signatureImageViewFrame];
  
  [[self view] addSubview:signatureImageView];
  
	
	[formatter release];
	[self hideLoading];
}


#pragma mark -
#pragma mark Support Methods

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
  self.navigationItem.titleView = nil;
}

- (void)didClickSendEmailButton {
  if ([popControl isPopoverVisible]) {
    self.email = emailPopover.emailTextField.text;
    [popControl dismissPopoverAnimated:YES];
    
    //Make call to webservice here
    SDZTickets *service = [[SDZTickets alloc]init];
    [service EmailTicket:self
                  action:@selector(sendEmailHandler:)
                deviceid:[APP_DELEGATE deviceId]
                    udid:[APP_DELEGATE UDID]
            locationcode:[NSString stringWithFormat:@"%d", [[self ticket].locationCode intValue]]
            ticketnumber:[self ticket].ticketNumber
            emailaddress:self.email];
    
    [service release];
  }
}

-(void)sendEmailHandler: (id) value {
  if([value isKindOfClass:[NSError class]]) {
    NSLog(@"sendEmail error: %@", value);
		return;
	}
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"sendEmail error: %@", value);
		return;
	}
  
  UIAlertView *emailAlert = [[UIAlertView alloc]initWithTitle:@"Email request sent!" message:[NSString stringWithFormat:@"Ticket sent to %@", self.email] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
  [emailAlert show];
  [emailAlert release];
                             
}

- (void)didClickDeliverButton {
  if ([popControl isPopoverVisible]) {
    [popControl dismissPopoverAnimated:YES];
  }
}

@end
