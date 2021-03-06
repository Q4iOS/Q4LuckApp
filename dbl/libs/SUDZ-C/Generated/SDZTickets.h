/*
	SDZTickets.h
	The interface definition of classes and methods for the Tickets web service.
	Generated by SudzC.com
*/
				
#import "Soap.h"
	
/* Add class references */
				
#import "SDZArrayOfTicket.h"
#import "SDZArrayOfScheduleInfo.h"
#import "SDZScheduleInfo.h"
#import "SDZMessageObject.h"
#import "SDZTicketResponse.h"
#import "SDZTicketUOM.h"
#import "SDZTicket.h"

/* Interface for the service */
				
@interface SDZTickets : SoapService
		
	// Returns SDZTicket*
	/*  */
	- (SoapRequest*) GetTicket: (id <SoapDelegate>) handler deviceid: (NSString*) deviceid udid: (NSString*) udid automated: (int) automated;
	- (SoapRequest*) GetTicket: (id) target action: (SEL) action deviceid: (NSString*) deviceid udid: (NSString*) udid automated: (int) automated;

	// Returns NSMutableArray*
	/*  */
	- (SoapRequest*) GetAllTickets: (id <SoapDelegate>) handler deviceid: (NSString*) deviceid udid: (NSString*) udid;
	- (SoapRequest*) GetAllTickets: (id) target action: (SEL) action deviceid: (NSString*) deviceid udid: (NSString*) udid;

	// Returns NSString*
	/*  */
	- (SoapRequest*) StoreLatLong: (id <SoapDelegate>) handler locations: (NSString*) locations;
	- (SoapRequest*) StoreLatLong: (id) target action: (SEL) action locations: (NSString*) locations;

	

	// Returns NSMutableArray*
	/*  */
	- (SoapRequest*) GetSchedule: (id <SoapDelegate>) handler deviceid: (NSString*) deviceid udid: (NSString*) udid;
	- (SoapRequest*) GetSchedule: (id) target action: (SEL) action deviceid: (NSString*) deviceid udid: (NSString*) udid;

	// Returns SDZMessageObject*
	/*  */
	- (SoapRequest*) GetMessage: (id <SoapDelegate>) handler deviceid: (NSString*) deviceid udid: (NSString*) udid;
	- (SoapRequest*) GetMessage: (id) target action: (SEL) action deviceid: (NSString*) deviceid udid: (NSString*) udid;

	// Returns NSString*
	/*  */
	- (SoapRequest*) AcknowledgeMessage: (id <SoapDelegate>) handler deviceid: (NSString*) deviceid udid: (NSString*) udid acknowledged: (int) acknowledged acknnowledgeddatetime: (NSDate*) acknnowledgeddatetime messageid: (int) messageid;
	- (SoapRequest*) AcknowledgeMessage: (id) target action: (SEL) action deviceid: (NSString*) deviceid udid: (NSString*) udid acknowledged: (int) acknowledged acknnowledgeddatetime: (NSDate*) acknnowledgeddatetime messageid: (int) messageid;

	// Returns NSString*
	/*  */
	- (SoapRequest*) LoadedDelivered: (id <SoapDelegate>) handler deviceid: (NSString*) deviceid udid: (NSString*) udid delivereddatetime: (NSDate*) delivereddatetime latitude: (NSString*) latitude longitude: (NSString*) longitude ticketnumber: (NSString*) ticketnumber locationcode: (NSString*) locationcode status: (int) status;
	- (SoapRequest*) LoadedDelivered: (id) target action: (SEL) action deviceid: (NSString*) deviceid udid: (NSString*) udid delivereddatetime: (NSDate*) delivereddatetime latitude: (NSString*) latitude longitude: (NSString*) longitude ticketnumber: (NSString*) ticketnumber locationcode: (NSString*) locationcode status: (int) status;

	// Returns NSString*
	/*  */
	- (SoapRequest*) Available: (id <SoapDelegate>) handler deviceid: (NSString*) deviceid udid: (NSString*) udid timestamp: (NSDate*) timestamp available: (int) available;
	- (SoapRequest*) Available: (id) target action: (SEL) action deviceid: (NSString*) deviceid udid: (NSString*) udid timestamp: (NSDate*) timestamp available: (int) available;

	// Returns NSString*
	/*  */
	- (SoapRequest*) AcceptMessage: (id <SoapDelegate>) handler deviceid: (NSString*) deviceid udid: (NSString*) udid accepted: (int) accepted acceptedddatetime: (NSDate*) acceptedddatetime messageid: (int) messageid;
	- (SoapRequest*) AcceptMessage: (id) target action: (SEL) action deviceid: (NSString*) deviceid udid: (NSString*) udid accepted: (int) accepted acceptedddatetime: (NSDate*) acceptedddatetime messageid: (int) messageid;

	// Returns NSString*
	/*  */
	- (SoapRequest*) TareTicket_Initial: (id <SoapDelegate>) handler deviceid: (NSString*) deviceid udid: (NSString*) udid tare_or_ticket: (int) tare_or_ticket latitude: (NSString*) latitude longitude: (NSString*) longitude;
	- (SoapRequest*) TareTicket_Initial: (id) target action: (SEL) action deviceid: (NSString*) deviceid udid: (NSString*) udid tare_or_ticket: (int) tare_or_ticket latitude: (NSString*) latitude longitude: (NSString*) longitude;

	// Returns NSString*
	/*  */
	- (SoapRequest*) SelfTare: (id <SoapDelegate>) handler deviceid: (NSString*) deviceid udid: (NSString*) udid laneid_preferred: (int) laneid_preferred laneid_selected: (int) laneid_selected latitude: (NSString*) latitude longitude: (NSString*) longitude;
	- (SoapRequest*) SelfTare: (id) target action: (SEL) action deviceid: (NSString*) deviceid udid: (NSString*) udid laneid_preferred: (int) laneid_preferred laneid_selected: (int) laneid_selected latitude: (NSString*) latitude longitude: (NSString*) longitude;

	// Returns SDZTicketResponse*
	/*  */
	- (SoapRequest*) SelfTicket: (id <SoapDelegate>) handler deviceid: (NSString*) deviceid udid: (NSString*) udid laneid_preferred: (int) laneid_preferred laneid_selected: (int) laneid_selected latitude: (NSString*) latitude longitude: (NSString*) longitude;
	- (SoapRequest*) SelfTicket: (id) target action: (SEL) action deviceid: (NSString*) deviceid udid: (NSString*) udid laneid_preferred: (int) laneid_preferred laneid_selected: (int) laneid_selected latitude: (NSString*) latitude longitude: (NSString*) longitude;

	// Returns NSString*
	/*  */
	- (SoapRequest*) EmailTicket: (id <SoapDelegate>) handler deviceid: (NSString*) deviceid udid: (NSString*) udid locationcode: (NSString*) locationcode ticketnumber: (NSString*) ticketnumber emailaddress: (NSString*) emailaddress;
	- (SoapRequest*) EmailTicket: (id) target action: (SEL) action deviceid: (NSString*) deviceid udid: (NSString*) udid locationcode: (NSString*) locationcode ticketnumber: (NSString*) ticketnumber emailaddress: (NSString*) emailaddress;

	// Returns NSString*
	/*  */
	- (SoapRequest*) GetReplys: (id <SoapDelegate>) handler deviceid: (NSString*) deviceid udid: (NSString*) udid;
	- (SoapRequest*) GetReplys: (id) target action: (SEL) action deviceid: (NSString*) deviceid udid: (NSString*) udid;

	// Returns NSString*
	/*  */
	- (SoapRequest*) GetStatuses: (id <SoapDelegate>) handler deviceid: (NSString*) deviceid udid: (NSString*) udid;
	- (SoapRequest*) GetStatuses: (id) target action: (SEL) action deviceid: (NSString*) deviceid udid: (NSString*) udid;

	// Returns NSString*
	/*  */
	- (SoapRequest*) GetSpeedLimit: (id <SoapDelegate>) handler deviceid: (NSString*) deviceid udid: (NSString*) udid;
	- (SoapRequest*) GetSpeedLimit: (id) target action: (SEL) action deviceid: (NSString*) deviceid udid: (NSString*) udid;

	// Returns NSString*
	/*  */
	- (SoapRequest*) SendReply: (id <SoapDelegate>) handler deviceid: (NSString*) deviceid udid: (NSString*) udid replydatetime: (NSDate*) replydatetime messageid: (int) messageid message: (NSString*) message;
	- (SoapRequest*) SendReply: (id) target action: (SEL) action deviceid: (NSString*) deviceid udid: (NSString*) udid replydatetime: (NSDate*) replydatetime messageid: (int) messageid message: (NSString*) message;

	// Returns NSString*
	/*  */
	- (SoapRequest*) SendStatus: (id <SoapDelegate>) handler deviceid: (NSString*) deviceid udid: (NSString*) udid statusdatetime: (NSDate*) statusdatetime status: (NSString*) status startstop: (int) startstop;
	- (SoapRequest*) SendStatus: (id) target action: (SEL) action deviceid: (NSString*) deviceid udid: (NSString*) udid statusdatetime: (NSDate*) statusdatetime status: (NSString*) status startstop: (int) startstop;

	// Returns SDZTicketResponse*
	/*  */
	- (SoapRequest*) TicketAssignment: (id <SoapDelegate>) handler deviceid: (NSString*) deviceid udid: (NSString*) udid timestamp: (NSDate*) timestamp latitude: (NSString*) latitude longitude: (NSString*) longitude locationcode: (int) locationcode productid: (NSString*) productid orderid: (NSString*) orderid customername: (NSString*) customername amount: (NSDecimalNumber*) amount type: (NSString*) type;
	- (SoapRequest*) TicketAssignment: (id) target action: (SEL) action deviceid: (NSString*) deviceid udid: (NSString*) udid timestamp: (NSDate*) timestamp latitude: (NSString*) latitude longitude: (NSString*) longitude locationcode: (int) locationcode productid: (NSString*) productid orderid: (NSString*) orderid customername: (NSString*) customername amount: (NSDecimalNumber*) amount type: (NSString*) type;
/*Qfor - Babu - July 15, 2013*/
/*Get Ticket Notes*/

- (SoapRequest*) GetTicketNotes: (id <SoapDelegate>) handler deviceid: (NSString*) deviceid udid: (NSString*) udid;
- (SoapRequest*) GetTicketNotes: (id) _target action: (SEL) _action deviceid: (NSString*) deviceid udid: (NSString*) udid;

/*Submit Ticket Notes*/

- (SoapRequest*) SubmitTicketNotes: (id <SoapDelegate>) handler signature: (NSString*) signature  signaturenumber:(int) signaturenumber    ticketnumber: (NSString*) ticketnumber locationcode: (NSString*) locationcode deviceid: (NSString*) deviceid udid: (NSString*) udid timestamp: (NSDate*) timestamp latitude: (NSString*) latitude longitude: (NSString*) longitude;
- (SoapRequest*) SubmitTicketNotes: (id) _target action: (SEL) _action deviceid: (NSString*) deviceid udid: (NSString*) udid  note: (NSString*) note ticketnumber: (int) ticketnumber locationcode: (NSString*) locationcode timestamp: (NSDate*) timestamp latitude: (NSString*) latitude longitude: (NSString*) longitude;



/*Store Signature  */
- (SoapRequest*) StoreSignature: (id <SoapDelegate>) handler signature: (NSString*) signature  signaturenumber:(int) signaturenumber    ticketnumber: (NSString*) ticketnumber locationcode: (NSString*) locationcode deviceid: (NSString*) deviceid udid: (NSString*) udid timestamp: (NSDate*) timestamp latitude: (NSString*) latitude longitude: (NSString*) longitude;
- (SoapRequest*) StoreSignature: (id) _target action: (SEL) _action signature: (NSString*) signature signaturenumber:(int) signaturenumber ticketnumber: (NSString*) ticketnumber locationcode: (NSString*) locationcode deviceid: (NSString*) deviceid udid: (NSString*) udid timestamp: (NSDate*) timestamp latitude: (NSString*) latitude longitude: (NSString*) longitude;

/*Webservice declaration Ending*/

	+ (SDZTickets*) service;
	+ (SDZTickets*) serviceWithUsername: (NSString*) username andPassword: (NSString*) password;
@end
	