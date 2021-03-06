/*
	SDZMessageObject.h
	The implementation of properties and methods for the SDZMessageObject object.
	Generated by SudzC.com
*/
#import "SDZMessageObject.h"

@implementation SDZMessageObject
	@synthesize Accepted = _Accepted;
	@synthesize AcceptedDateTime = _AcceptedDateTime;
	@synthesize Acknowledged = _Acknowledged;
	@synthesize AcknowledgedDateTime = _AcknowledgedDateTime;
	@synthesize Closed = _Closed;
	@synthesize CreatedDate = _CreatedDate;
	@synthesize DeviceID = _DeviceID;
	@synthesize ExpirationDate = _ExpirationDate;
	@synthesize Message = _Message;
	@synthesize MessageID = _MessageID;
	@synthesize MessageType = _MessageType;
	@synthesize Priority = _Priority;
	@synthesize RecordID = _RecordID;
	@synthesize Sender = _Sender;
	@synthesize TruckNumber = _TruckNumber;
	@synthesize UDID = _UDID;
	@synthesize UserID = _UserID;

	- (id) init
	{
		if(self = [super init])
		{
			self.AcceptedDateTime = nil;
			self.AcknowledgedDateTime = nil;
			self.CreatedDate = nil;
			self.DeviceID = nil;
			self.ExpirationDate = nil;
			self.Message = nil;
			self.Sender = nil;
			self.TruckNumber = nil;
			self.UDID = nil;
			self.UserID = nil;

		}
		return self;
	}

	+ (SDZMessageObject*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return [[[self alloc] initWithNode: node] autorelease];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Accepted = [[Soap getNodeValue: node withName: @"Accepted"] intValue];
			self.AcceptedDateTime = [Soap dateFromString: [Soap getNodeValue: node withName: @"AcceptedDateTime"]];
			self.Acknowledged = [[Soap getNodeValue: node withName: @"Acknowledged"] intValue];
			self.AcknowledgedDateTime = [Soap dateFromString: [Soap getNodeValue: node withName: @"AcknowledgedDateTime"]];
			self.Closed = [[Soap getNodeValue: node withName: @"Closed"] boolValue];
			self.CreatedDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"CreatedDate"]];
			self.DeviceID = [Soap getNodeValue: node withName: @"DeviceID"];
			self.ExpirationDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"ExpirationDate"]];
			self.Message = [Soap getNodeValue: node withName: @"Message"];
			self.MessageID = [[Soap getNodeValue: node withName: @"MessageID"] intValue];
			self.MessageType = [[Soap getNodeValue: node withName: @"MessageType"] intValue];
			self.Priority = [[Soap getNodeValue: node withName: @"Priority"] intValue];
			self.RecordID = [[Soap getNodeValue: node withName: @"RecordID"] intValue];
			self.Sender = [Soap getNodeValue: node withName: @"Sender"];
			self.TruckNumber = [Soap getNodeValue: node withName: @"TruckNumber"];
			self.UDID = [Soap getNodeValue: node withName: @"UDID"];
			self.UserID = [Soap getNodeValue: node withName: @"UserID"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"MessageObject"];
	}
  
	- (NSMutableString*) serialize: (NSString*) nodeName
	{
		NSMutableString* s = [NSMutableString string];
		[s appendFormat: @"<%@", nodeName];
		[s appendString: [self serializeAttributes]];
		[s appendString: @">"];
		[s appendString: [self serializeElements]];
		[s appendFormat: @"</%@>", nodeName];
		return s;
	}
	
	- (NSMutableString*) serializeElements
	{
		NSMutableString* s = [super serializeElements];
		[s appendFormat: @"<Accepted>%@</Accepted>", [NSString stringWithFormat: @"%i", self.Accepted]];
		if (self.AcceptedDateTime != nil) [s appendFormat: @"<AcceptedDateTime>%@</AcceptedDateTime>", [Soap getDateString: self.AcceptedDateTime]];
		[s appendFormat: @"<Acknowledged>%@</Acknowledged>", [NSString stringWithFormat: @"%i", self.Acknowledged]];
		if (self.AcknowledgedDateTime != nil) [s appendFormat: @"<AcknowledgedDateTime>%@</AcknowledgedDateTime>", [Soap getDateString: self.AcknowledgedDateTime]];
		[s appendFormat: @"<Closed>%@</Closed>", (self.Closed)?@"true":@"false"];
		if (self.CreatedDate != nil) [s appendFormat: @"<CreatedDate>%@</CreatedDate>", [Soap getDateString: self.CreatedDate]];
		if (self.DeviceID != nil) [s appendFormat: @"<DeviceID>%@</DeviceID>", [[self.DeviceID stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.ExpirationDate != nil) [s appendFormat: @"<ExpirationDate>%@</ExpirationDate>", [Soap getDateString: self.ExpirationDate]];
		if (self.Message != nil) [s appendFormat: @"<Message>%@</Message>", [[self.Message stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<MessageID>%@</MessageID>", [NSString stringWithFormat: @"%i", self.MessageID]];
		[s appendFormat: @"<MessageType>%@</MessageType>", [NSString stringWithFormat: @"%i", self.MessageType]];
		[s appendFormat: @"<Priority>%@</Priority>", [NSString stringWithFormat: @"%i", self.Priority]];
		[s appendFormat: @"<RecordID>%@</RecordID>", [NSString stringWithFormat: @"%i", self.RecordID]];
		if (self.Sender != nil) [s appendFormat: @"<Sender>%@</Sender>", [[self.Sender stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.TruckNumber != nil) [s appendFormat: @"<TruckNumber>%@</TruckNumber>", [[self.TruckNumber stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.UDID != nil) [s appendFormat: @"<UDID>%@</UDID>", [[self.UDID stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.UserID != nil) [s appendFormat: @"<UserID>%@</UserID>", [[self.UserID stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[SDZMessageObject class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}
	
	- (void) dealloc
	{
		self.AcceptedDateTime = nil;
		self.AcknowledgedDateTime = nil;
		self.CreatedDate = nil;
		self.DeviceID = nil;
		self.ExpirationDate = nil;
		self.Message = nil;
		self.Sender = nil;
		self.TruckNumber = nil;
		self.UDID = nil;
		self.UserID = nil;
		[super dealloc];
	}

@end
