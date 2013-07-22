/*
	SDZTicketsExample.m
	Provides example and test runs the service's proxy methods.
	Generated by SudzC.com
*/
#import "SDZTicketsExample.h"
#import "SDZTickets.h"

@implementation SDZTicketsExample

- (void)run {
	// Create the service
	SDZTickets* service = [SDZTickets service];
	service.logging = YES;
	// service.username = @"username";
	// service.password = @"password";
	

	// Returns NSString*
	/*  */
	[service AcceptMessage:self action:@selector(AcceptMessageHandler:) deviceid: @"" udid: @"" accepted: 0 acceptedddatetime: [NSDate date] messageid: 0];

	// Returns NSString*
	/*  */
	[service AcknowledgeMessage:self action:@selector(AcknowledgeMessageHandler:) deviceid: @"" udid: @"" acknowledged: 0 acknnowledgeddatetime: [NSDate date] messageid: 0];

	// Returns NSString*
	/*  */
	[service Available:self action:@selector(AvailableHandler:) deviceid: @"" udid: @"" timestamp: [NSDate date] available: 0];

	// Returns NSString*
	/*  */
	[service EmailTicket:self action:@selector(EmailTicketHandler:) deviceid: @"" udid: @"" locationcode: @"" ticketnumber: @"" emailaddress: @""];

	// Returns NSMutableArray*
	/*  */
	[service GetAllTickets:self action:@selector(GetAllTicketsHandler:) deviceid: @"" udid: @""];

	// Returns SDZMessageObject*
	/*  */
	[service GetMessage:self action:@selector(GetMessageHandler:) deviceid: @"" udid: @""];

	// Returns NSString*
	/*  */
	[service GetReplys:self action:@selector(GetReplysHandler:) deviceid: @"" udid: @""];

	// Returns NSMutableArray*
	/*  */
	[service GetSchedule:self action:@selector(GetScheduleHandler:) deviceid: @"" udid: @""];

	// Returns NSString*
	/*  */
	[service GetSpeedLimit:self action:@selector(GetSpeedLimitHandler:) deviceid: @"" udid: @""];

	// Returns NSString*
	/*  */
	[service GetStatuses:self action:@selector(GetStatusesHandler:) deviceid: @"" udid: @""];

	// Returns SDZTicket*
	/*  */
	[service GetTicket:self action:@selector(GetTicketHandler:) deviceid: @"" udid: @"" automated: 0];

	// Returns NSString*
	/*  */
	[service LoadedDelivered:self action:@selector(LoadedDeliveredHandler:) deviceid: @"" udid: @"" delivereddatetime: [NSDate date] latitude: @"" longitude: @"" ticketnumber: @"" locationcode: @"" status: 0];

	// Returns NSString*
	/*  */
	[service SelfTare:self action:@selector(SelfTareHandler:) deviceid: @"" udid: @"" laneid_preferred: 0 laneid_selected: 0 latitude: @"" longitude: @""];

	// Returns SDZTicketResponse*
	/*  */
	[service SelfTicket:self action:@selector(SelfTicketHandler:) deviceid: @"" udid: @"" laneid_preferred: 0 laneid_selected: 0 latitude: @"" longitude: @""];

	// Returns NSString*
	/*  */
	[service SendReply:self action:@selector(SendReplyHandler:) deviceid: @"" udid: @"" replydatetime: [NSDate date] messageid: 0 message: @""];

	// Returns NSString*
	/*  */
	[service SendStatus:self action:@selector(SendStatusHandler:) deviceid: @"" udid: @"" statusdatetime: [NSDate date] status: @"" startstop: 0];

	// Returns NSString*
	/*  */
	[service StoreLatLong:self action:@selector(StoreLatLongHandler:) locations: @""];

	// Returns NSString*
	/*  */
	[service StoreSignature:self action:@selector(StoreSignatureHandler:) signature: @"" signaturenumber:0 ticketnumber: @"" locationcode: @"" deviceid: @"" udid: @"" timestamp: [NSDate date] latitude: @"" longitude: @""];

	// Returns NSString*
	/*  */
	[service TareTicket_Initial:self action:@selector(TareTicket_InitialHandler:) deviceid: @"" udid: @"" tare_or_ticket: 0 latitude: @"" longitude: @""];

	// Returns SDZTicketResponse*
	/*  */
	[service TicketAssignment:self action:@selector(TicketAssignmentHandler:) deviceid: @"" udid: @"" timestamp: [NSDate date] latitude: @"" longitude: @"" locationcode: 0 productid: @"" orderid: @"" customername: @"" amount: [NSDecimalNumber numberWithInt:0] type: @""];
}

	

// Handle the response from AcceptMessage.
		
- (void) AcceptMessageHandler: (id) value {

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
	NSLog(@"AcceptMessage returned the value: %@", result);
			
}
	

// Handle the response from AcknowledgeMessage.
		
- (void) AcknowledgeMessageHandler: (id) value {

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
	NSLog(@"AcknowledgeMessage returned the value: %@", result);
			
}
	

// Handle the response from Available.
		
- (void) AvailableHandler: (id) value {

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
	NSLog(@"Available returned the value: %@", result);
			
}
	

// Handle the response from EmailTicket.
		
- (void) EmailTicketHandler: (id) value {

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
	NSLog(@"EmailTicket returned the value: %@", result);
			
}
	

// Handle the response from GetAllTickets.
		
- (void) GetAllTicketsHandler: (id) value {

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
			

	// Do something with the NSMutableArray* result
		NSMutableArray* result = (NSMutableArray*)value;
	NSLog(@"GetAllTickets returned the value: %@", result);
			
}
	

// Handle the response from GetMessage.
		
- (void) GetMessageHandler: (id) value {

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
			

	// Do something with the SDZMessageObject* result
		SDZMessageObject* result = (SDZMessageObject*)value;
	NSLog(@"GetMessage returned the value: %@", result);
			
}
	

// Handle the response from GetReplys.
		
- (void) GetReplysHandler: (id) value {

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
	NSLog(@"GetReplys returned the value: %@", result);
			
}
	

// Handle the response from GetSchedule.
		
- (void) GetScheduleHandler: (id) value {

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
			

	// Do something with the NSMutableArray* result
		NSMutableArray* result = (NSMutableArray*)value;
	NSLog(@"GetSchedule returned the value: %@", result);
			
}
	

// Handle the response from GetSpeedLimit.
		
- (void) GetSpeedLimitHandler: (id) value {

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
	NSLog(@"GetSpeedLimit returned the value: %@", result);
			
}
	

// Handle the response from GetStatuses.
		
- (void) GetStatusesHandler: (id) value {

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
	NSLog(@"GetStatuses returned the value: %@", result);
			
}
	

// Handle the response from GetTicket.
		
- (void) GetTicketHandler: (id) value {

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
			

	// Do something with the SDZTicket* result
		SDZTicket* result = (SDZTicket*)value;
	NSLog(@"GetTicket returned the value: %@", result);
			
}
	

// Handle the response from LoadedDelivered.
		
- (void) LoadedDeliveredHandler: (id) value {

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
	

// Handle the response from SelfTare.
		
- (void) SelfTareHandler: (id) value {

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
	NSLog(@"SelfTare returned the value: %@", result);
			
}
	

// Handle the response from SelfTicket.
		
- (void) SelfTicketHandler: (id) value {

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
			

	// Do something with the SDZTicketResponse* result
		SDZTicketResponse* result = (SDZTicketResponse*)value;
	NSLog(@"SelfTicket returned the value: %@", result);
			
}
	

// Handle the response from SendReply.
		
- (void) SendReplyHandler: (id) value {

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
	NSLog(@"SendReply returned the value: %@", result);
			
}
	

// Handle the response from SendStatus.
		
- (void) SendStatusHandler: (id) value {

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
	NSLog(@"SendStatus returned the value: %@", result);
			
}
	

// Handle the response from StoreLatLong.
		
- (void) StoreLatLongHandler: (id) value {

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
	NSLog(@"StoreLatLong returned the value: %@", result);
			
}
	

// Handle the response from StoreSignature.
		
- (void) StoreSignatureHandler: (id) value {

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
	NSLog(@"StoreSignature returned the value: %@", result);
			
}
	

// Handle the response from TareTicket_Initial.
		
- (void) TareTicket_InitialHandler: (id) value {

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
	NSLog(@"TareTicket_Initial returned the value: %@", result);
			
}
	

// Handle the response from TicketAssignment.
		
- (void) TicketAssignmentHandler: (id) value {

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
			

	// Do something with the SDZTicketResponse* result
		SDZTicketResponse* result = (SDZTicketResponse*)value;
	NSLog(@"TicketAssignment returned the value: %@", result);
			
}
	

@end
		