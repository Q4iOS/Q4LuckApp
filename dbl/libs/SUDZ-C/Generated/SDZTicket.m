/*
	SDZTicket.h
	The implementation of properties and methods for the SDZTicket object.
	Generated by SudzC.com
*/
#import "SDZTicket.h"

#import "SDZTicketUOM.h"
@implementation SDZTicket
	@synthesize AddressID = _AddressID;
	@synthesize Copy = _Copy;
	@synthesize CopyReprint = _CopyReprint;
	@synthesize CustomerAcctNumber = _CustomerAcctNumber;
	@synthesize CustomerAddress = _CustomerAddress;
	@synthesize CustomerID = _CustomerID;
	@synthesize DeliveryInstructions = _DeliveryInstructions;
	@synthesize FuelSurcharge = _FuelSurcharge;
	@synthesize GrossWt = _GrossWt;
	@synthesize HaulCharge = _HaulCharge;
	@synthesize HaulIndicator = _HaulIndicator;
	@synthesize HaulRate = _HaulRate;
	@synthesize HaulerName = _HaulerName;
	@synthesize HaulerNumber = _HaulerNumber;
	@synthesize JobContact = _JobContact;
	@synthesize JobPhone = _JobPhone;
	@synthesize LastPage = _LastPage;
	@synthesize Latitude = _Latitude;
	@synthesize LoadsForYear = _LoadsForYear;
	@synthesize LocationCode = _LocationCode;
	@synthesize LocationName = _LocationName;
	@synthesize Longitude = _Longitude;
	@synthesize LotSample = _LotSample;
	@synthesize MaxGross = _MaxGross;
	@synthesize MetricTonsLoadsToday = _MetricTonsLoadsToday;
	@synthesize MetricTonsQtyDelivered = _MetricTonsQtyDelivered;
	@synthesize MetricTonsQtyDeliveryToday = _MetricTonsQtyDeliveryToday;
	@synthesize MetricTonsQtyOrdered = _MetricTonsQtyOrdered;
	@synthesize NetTons = _NetTons;
	@synthesize NetTonsMetric = _NetTonsMetric;
	@synthesize NetWeight = _NetWeight;
	@synthesize OrderID = _OrderID;
	@synthesize OrderPriceIndicator = _OrderPriceIndicator;
	@synthesize OrderQtyIndicator = _OrderQtyIndicator;
	@synthesize OrderQtyIndicatorName = _OrderQtyIndicatorName;
	@synthesize OrderStateJob = _OrderStateJob;
	@synthesize Plant = _Plant;
	@synthesize PrintPrice = _PrintPrice;
	@synthesize PrintShort = _PrintShort;
	@synthesize ProductCertification = _ProductCertification;
	@synthesize ProductCertificationDefault = _ProductCertificationDefault;
	@synthesize ProductCode = _ProductCode;
	@synthesize ProductDescription = _ProductDescription;
	@synthesize ProjectDescription = _ProjectDescription;
	@synthesize ProjectID = _ProjectID;
	@synthesize PurchaseOrder = _PurchaseOrder;
	@synthesize SalesTax = _SalesTax;
	@synthesize ScaleUsed = _ScaleUsed;
	@synthesize ShortTonsLoadsToday = _ShortTonsLoadsToday;
	@synthesize ShortTonsQtyDelivered = _ShortTonsQtyDelivered;
	@synthesize ShortTonsQtyDeliveryToday = _ShortTonsQtyDeliveryToday;
	@synthesize ShortTonsQtyOrdered = _ShortTonsQtyOrdered;
	@synthesize Signature = _Signature;
	@synthesize SpecialInstructions = _SpecialInstructions;
	@synthesize StonePrice = _StonePrice;
	@synthesize StoneRate = _StoneRate;
	@synthesize TareWt = _TareWt;
	@synthesize TicketDate = _TicketDate;
	@synthesize TicketNumber = _TicketNumber;
	@synthesize TicketTime = _TicketTime;
	@synthesize Total = _Total;
	@synthesize TruckNumber = _TruckNumber;
	@synthesize TruckOwner = _TruckOwner;
	@synthesize TurnAroundMins = _TurnAroundMins;
	@synthesize UOM = _UOM;
	@synthesize Warning1 = _Warning1;
	@synthesize Warning2 = _Warning2;
	@synthesize WaterIndicator = _WaterIndicator;
	@synthesize Weighmaster = _Weighmaster;
	@synthesize _TicketDateTime = __TicketDateTime;
  @synthesize Notes = _Notes;

  @synthesize Signature1 = _Signature1;
  @synthesize Signature2 = _Signature2;
  @synthesize Signature3 = _Signature3;
  @synthesize Signature4 = _Signature4;

	- (id) init
	{
		if(self = [super init])
		{
			self.Copy = nil;
			self.CopyReprint = nil;
			self.CustomerAcctNumber = nil;
			self.CustomerAddress = nil;
			self.DeliveryInstructions = nil;
			self.FuelSurcharge = nil;
			self.GrossWt = nil;
			self.HaulCharge = nil;
			self.HaulIndicator = nil;
			self.HaulRate = nil;
			self.HaulerName = nil;
			self.HaulerNumber = nil;
			self.JobContact = nil;
			self.JobPhone = nil;
			self.Latitude = nil;
			self.LoadsForYear = nil;
			self.LocationName = nil;
			self.Longitude = nil;
			self.LotSample = nil;
			self.MaxGross = nil;
			self.MetricTonsLoadsToday = nil;
			self.MetricTonsQtyDelivered = nil;
			self.MetricTonsQtyDeliveryToday = nil;
			self.MetricTonsQtyOrdered = nil;
			self.NetTons = nil;
			self.NetTonsMetric = nil;
			self.NetWeight = nil;
			self.OrderID = nil;
			self.OrderPriceIndicator = nil;
			self.OrderQtyIndicator = nil;
			self.OrderQtyIndicatorName = nil;
			self.OrderStateJob = nil;
			self.Plant = nil;
			self.PrintPrice = nil;
			self.PrintShort = nil;
			self.ProductCertification = nil;
			self.ProductCertificationDefault = nil;
			self.ProductCode = nil;
			self.ProductDescription = nil;
			self.ProjectDescription = nil;
			self.ProjectID = nil;
			self.PurchaseOrder = nil;
			self.SalesTax = nil;
			self.ScaleUsed = nil;
			self.ShortTonsLoadsToday = nil;
			self.ShortTonsQtyDelivered = nil;
			self.ShortTonsQtyDeliveryToday = nil;
			self.ShortTonsQtyOrdered = nil;
			self.Signature = nil;
			self.SpecialInstructions = nil;
			self.StonePrice = nil;
			self.StoneRate = nil;
			self.TareWt = nil;
			self.TicketDate = nil;
			self.TicketNumber = nil;
			self.TicketTime = nil;
			self.Total = nil;
			self.TruckNumber = nil;
			self.TruckOwner = nil;
			self.UOM = nil; // [[SDZTicketUOM alloc] init];
			self.Warning1 = nil;
			self.Warning2 = nil;
			self.WaterIndicator = nil;
			self.Weighmaster = nil;
			self._TicketDateTime = nil;
      self.Signature1 = nil;
      self.Signature2 = nil;
			self.Signature3 = nil;
			self.Signature4 = nil;
      self.Notes = nil;

		}
		return self;
	}

	+ (SDZTicket*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return [[[self alloc] initWithNode: node] autorelease];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.AddressID = [[Soap getNodeValue: node withName: @"AddressID"] intValue];
			self.Copy = [Soap getNodeValue: node withName: @"Copy"];
			self.CopyReprint = [Soap getNodeValue: node withName: @"CopyReprint"];
			self.CustomerAcctNumber = [Soap getNodeValue: node withName: @"CustomerAcctNumber"];
			self.CustomerAddress = [Soap getNodeValue: node withName: @"CustomerAddress"];
			self.CustomerID = [[Soap getNodeValue: node withName: @"CustomerID"] intValue];
			self.DeliveryInstructions = [Soap getNodeValue: node withName: @"DeliveryInstructions"];
			self.FuelSurcharge = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"FuelSurcharge"]];
			self.GrossWt = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"GrossWt"]];
			self.HaulCharge = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"HaulCharge"]];
			self.HaulIndicator = [Soap getNodeValue: node withName: @"HaulIndicator"];
			self.HaulRate = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"HaulRate"]];
			self.HaulerName = [Soap getNodeValue: node withName: @"HaulerName"];
			self.HaulerNumber = [Soap getNodeValue: node withName: @"HaulerNumber"];
			self.JobContact = [Soap getNodeValue: node withName: @"JobContact"];
			self.JobPhone = [Soap getNodeValue: node withName: @"JobPhone"];
			self.LastPage = [[Soap getNodeValue: node withName: @"LastPage"] boolValue];
			self.Latitude = [Soap getNodeValue: node withName: @"Latitude"];
			self.LoadsForYear = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"LoadsForYear"]];
			self.LocationCode = [[Soap getNodeValue: node withName: @"LocationCode"] intValue];
			self.LocationName = [Soap getNodeValue: node withName: @"LocationName"];
			self.Longitude = [Soap getNodeValue: node withName: @"Longitude"];
			self.LotSample = [Soap getNodeValue: node withName: @"LotSample"];
			self.MaxGross = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"MaxGross"]];
			self.MetricTonsLoadsToday = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"MetricTonsLoadsToday"]];
			self.MetricTonsQtyDelivered = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"MetricTonsQtyDelivered"]];
			self.MetricTonsQtyDeliveryToday = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"MetricTonsQtyDeliveryToday"]];
			self.MetricTonsQtyOrdered = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"MetricTonsQtyOrdered"]];
			self.NetTons = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"NetTons"]];
			self.NetTonsMetric = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"NetTonsMetric"]];
			self.NetWeight = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"NetWeight"]];
			self.OrderID = [Soap getNodeValue: node withName: @"OrderID"];
			self.OrderPriceIndicator = [Soap getNodeValue: node withName: @"OrderPriceIndicator"];
			self.OrderQtyIndicator = [Soap getNodeValue: node withName: @"OrderQtyIndicator"];
			self.OrderQtyIndicatorName = [Soap getNodeValue: node withName: @"OrderQtyIndicatorName"];
			self.OrderStateJob = [Soap getNodeValue: node withName: @"OrderStateJob"];
			self.Plant = [Soap getNodeValue: node withName: @"Plant"];
			self.PrintPrice = [Soap getNodeValue: node withName: @"PrintPrice"];
			self.PrintShort = [Soap getNodeValue: node withName: @"PrintShort"];
			self.ProductCertification = [Soap getNodeValue: node withName: @"ProductCertification"];
			self.ProductCertificationDefault = [Soap getNodeValue: node withName: @"ProductCertificationDefault"];
			self.ProductCode = [Soap getNodeValue: node withName: @"ProductCode"];
			self.ProductDescription = [Soap getNodeValue: node withName: @"ProductDescription"];
			self.ProjectDescription = [Soap getNodeValue: node withName: @"ProjectDescription"];
			self.ProjectID = [Soap getNodeValue: node withName: @"ProjectID"];
			self.PurchaseOrder = [Soap getNodeValue: node withName: @"PurchaseOrder"];
			self.SalesTax = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"SalesTax"]];
			self.ScaleUsed = [Soap getNodeValue: node withName: @"ScaleUsed"];
			self.ShortTonsLoadsToday = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"ShortTonsLoadsToday"]];
			self.ShortTonsQtyDelivered = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"ShortTonsQtyDelivered"]];
			self.ShortTonsQtyDeliveryToday = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"ShortTonsQtyDeliveryToday"]];
			self.ShortTonsQtyOrdered = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"ShortTonsQtyOrdered"]];
			self.Signature = [Soap dataFromString: [Soap getNodeValue: node withName: @"Signature"]];
			self.SpecialInstructions = [Soap getNodeValue: node withName: @"SpecialInstructions"];
			self.StonePrice = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"StonePrice"]];
			self.StoneRate = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"StoneRate"]];
			self.TareWt = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"TareWt"]];
			self.TicketDate = [Soap getNodeValue: node withName: @"TicketDate"];
			self.TicketNumber = [Soap getNodeValue: node withName: @"TicketNumber"];
			self.TicketTime = [Soap getNodeValue: node withName: @"TicketTime"];
			self.Total = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"Total"]];
			self.TruckNumber = [Soap getNodeValue: node withName: @"TruckNumber"];
			self.TruckOwner = [Soap getNodeValue: node withName: @"TruckOwner"];
			self.TurnAroundMins = [[Soap getNodeValue: node withName: @"TurnAroundMins"] intValue];
			self.UOM = [[SDZTicketUOM createWithNode: [Soap getNode: node withName: @"UOM"]] object];
			self.Warning1 = [Soap getNodeValue: node withName: @"Warning1"];
			self.Warning2 = [Soap getNodeValue: node withName: @"Warning2"];
			self.WaterIndicator = [Soap getNodeValue: node withName: @"WaterIndicator"];
			self.Weighmaster = [Soap getNodeValue: node withName: @"Weighmaster"];
			self._TicketDateTime = [Soap dateFromString: [Soap getNodeValue: node withName: @"_TicketDateTime"]];
      /*Qfor Babu -july 15 2013*/
      self.Notes = [Soap getNodeValue: node withName: @"Notes"];// Notes field
      //signature data field to string
			self.Signature1 = [Soap dataFromString: [Soap getNodeValue: node withName: @"Signature1"]];
      self.Signature2 = [Soap dataFromString: [Soap getNodeValue: node withName: @"Signature2"]];
			self.Signature3 = [Soap dataFromString: [Soap getNodeValue: node withName: @"Signature3"]];
			self.Signature4 = [Soap dataFromString: [Soap getNodeValue: node withName: @"Signature4"]];

		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"Ticket"];
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
		[s appendFormat: @"<AddressID>%@</AddressID>", [NSString stringWithFormat: @"%i", self.AddressID]];
		if (self.Copy != nil) [s appendFormat: @"<Copy>%@</Copy>", [[self.Copy stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.CopyReprint != nil) [s appendFormat: @"<CopyReprint>%@</CopyReprint>", [[self.CopyReprint stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.CustomerAcctNumber != nil) [s appendFormat: @"<CustomerAcctNumber>%@</CustomerAcctNumber>", [[self.CustomerAcctNumber stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.CustomerAddress != nil) [s appendFormat: @"<CustomerAddress>%@</CustomerAddress>", [[self.CustomerAddress stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<CustomerID>%@</CustomerID>", [NSString stringWithFormat: @"%i", self.CustomerID]];
		if (self.DeliveryInstructions != nil) [s appendFormat: @"<DeliveryInstructions>%@</DeliveryInstructions>", [[self.DeliveryInstructions stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.FuelSurcharge != nil) [s appendFormat: @"<FuelSurcharge>%@</FuelSurcharge>", [NSString stringWithFormat: @"%@", self.FuelSurcharge]];
		if (self.GrossWt != nil) [s appendFormat: @"<GrossWt>%@</GrossWt>", [NSString stringWithFormat: @"%@", self.GrossWt]];
		if (self.HaulCharge != nil) [s appendFormat: @"<HaulCharge>%@</HaulCharge>", [NSString stringWithFormat: @"%@", self.HaulCharge]];
		if (self.HaulIndicator != nil) [s appendFormat: @"<HaulIndicator>%@</HaulIndicator>", [[self.HaulIndicator stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.HaulRate != nil) [s appendFormat: @"<HaulRate>%@</HaulRate>", [NSString stringWithFormat: @"%@", self.HaulRate]];
		if (self.HaulerName != nil) [s appendFormat: @"<HaulerName>%@</HaulerName>", [[self.HaulerName stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.HaulerNumber != nil) [s appendFormat: @"<HaulerNumber>%@</HaulerNumber>", [[self.HaulerNumber stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.JobContact != nil) [s appendFormat: @"<JobContact>%@</JobContact>", [[self.JobContact stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.JobPhone != nil) [s appendFormat: @"<JobPhone>%@</JobPhone>", [[self.JobPhone stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<LastPage>%@</LastPage>", (self.LastPage)?@"true":@"false"];
		if (self.Latitude != nil) [s appendFormat: @"<Latitude>%@</Latitude>", [[self.Latitude stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.LoadsForYear != nil) [s appendFormat: @"<LoadsForYear>%@</LoadsForYear>", [NSString stringWithFormat: @"%@", self.LoadsForYear]];
		[s appendFormat: @"<LocationCode>%@</LocationCode>", [NSString stringWithFormat: @"%i", self.LocationCode]];
		if (self.LocationName != nil) [s appendFormat: @"<LocationName>%@</LocationName>", [[self.LocationName stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Longitude != nil) [s appendFormat: @"<Longitude>%@</Longitude>", [[self.Longitude stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.LotSample != nil) [s appendFormat: @"<LotSample>%@</LotSample>", [[self.LotSample stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.MaxGross != nil) [s appendFormat: @"<MaxGross>%@</MaxGross>", [NSString stringWithFormat: @"%@", self.MaxGross]];
		if (self.MetricTonsLoadsToday != nil) [s appendFormat: @"<MetricTonsLoadsToday>%@</MetricTonsLoadsToday>", [NSString stringWithFormat: @"%@", self.MetricTonsLoadsToday]];
		if (self.MetricTonsQtyDelivered != nil) [s appendFormat: @"<MetricTonsQtyDelivered>%@</MetricTonsQtyDelivered>", [NSString stringWithFormat: @"%@", self.MetricTonsQtyDelivered]];
		if (self.MetricTonsQtyDeliveryToday != nil) [s appendFormat: @"<MetricTonsQtyDeliveryToday>%@</MetricTonsQtyDeliveryToday>", [NSString stringWithFormat: @"%@", self.MetricTonsQtyDeliveryToday]];
		if (self.MetricTonsQtyOrdered != nil) [s appendFormat: @"<MetricTonsQtyOrdered>%@</MetricTonsQtyOrdered>", [NSString stringWithFormat: @"%@", self.MetricTonsQtyOrdered]];
    //Notes field value passing
    if (self.Notes != nil) [s appendFormat: @"<Notes>%@</Notes>", [[self.Notes stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.NetTons != nil) [s appendFormat: @"<NetTons>%@</NetTons>", [NSString stringWithFormat: @"%@", self.NetTons]];
		if (self.NetTonsMetric != nil) [s appendFormat: @"<NetTonsMetric>%@</NetTonsMetric>", [NSString stringWithFormat: @"%@", self.NetTonsMetric]];
		if (self.NetWeight != nil) [s appendFormat: @"<NetWeight>%@</NetWeight>", [NSString stringWithFormat: @"%@", self.NetWeight]];
		if (self.OrderID != nil) [s appendFormat: @"<OrderID>%@</OrderID>", [[self.OrderID stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.OrderPriceIndicator != nil) [s appendFormat: @"<OrderPriceIndicator>%@</OrderPriceIndicator>", [[self.OrderPriceIndicator stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.OrderQtyIndicator != nil) [s appendFormat: @"<OrderQtyIndicator>%@</OrderQtyIndicator>", [[self.OrderQtyIndicator stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.OrderQtyIndicatorName != nil) [s appendFormat: @"<OrderQtyIndicatorName>%@</OrderQtyIndicatorName>", [[self.OrderQtyIndicatorName stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.OrderStateJob != nil) [s appendFormat: @"<OrderStateJob>%@</OrderStateJob>", [[self.OrderStateJob stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Plant != nil) [s appendFormat: @"<Plant>%@</Plant>", [[self.Plant stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.PrintPrice != nil) [s appendFormat: @"<PrintPrice>%@</PrintPrice>", [[self.PrintPrice stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.PrintShort != nil) [s appendFormat: @"<PrintShort>%@</PrintShort>", [[self.PrintShort stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.ProductCertification != nil) [s appendFormat: @"<ProductCertification>%@</ProductCertification>", [[self.ProductCertification stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.ProductCertificationDefault != nil) [s appendFormat: @"<ProductCertificationDefault>%@</ProductCertificationDefault>", [[self.ProductCertificationDefault stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.ProductCode != nil) [s appendFormat: @"<ProductCode>%@</ProductCode>", [[self.ProductCode stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.ProductDescription != nil) [s appendFormat: @"<ProductDescription>%@</ProductDescription>", [[self.ProductDescription stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.ProjectDescription != nil) [s appendFormat: @"<ProjectDescription>%@</ProjectDescription>", [[self.ProjectDescription stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.ProjectID != nil) [s appendFormat: @"<ProjectID>%@</ProjectID>", [[self.ProjectID stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.PurchaseOrder != nil) [s appendFormat: @"<PurchaseOrder>%@</PurchaseOrder>", [[self.PurchaseOrder stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.SalesTax != nil) [s appendFormat: @"<SalesTax>%@</SalesTax>", [NSString stringWithFormat: @"%@", self.SalesTax]];
		if (self.ScaleUsed != nil) [s appendFormat: @"<ScaleUsed>%@</ScaleUsed>", [[self.ScaleUsed stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
    // signture field value passing
		if (self.Signature1 != nil) [s appendFormat: @"<Signature1>%@</Signature1>", [Soap getBase64String: self.Signature1]];
    if (self.Signature2 != nil) [s appendFormat: @"<Signature2>%@</Signature2>", [Soap getBase64String: self.Signature2]];
		if (self.Signature3 != nil) [s appendFormat: @"<Signature3>%@</Signature3>", [Soap getBase64String: self.Signature3]];
		if (self.Signature4 != nil) [s appendFormat: @"<Signature4>%@</Signature4>", [Soap getBase64String: self.Signature4]];
		if (self.ShortTonsLoadsToday != nil) [s appendFormat: @"<ShortTonsLoadsToday>%@</ShortTonsLoadsToday>", [NSString stringWithFormat: @"%@", self.ShortTonsLoadsToday]];
		if (self.ShortTonsQtyDelivered != nil) [s appendFormat: @"<ShortTonsQtyDelivered>%@</ShortTonsQtyDelivered>", [NSString stringWithFormat: @"%@", self.ShortTonsQtyDelivered]];
		if (self.ShortTonsQtyDeliveryToday != nil) [s appendFormat: @"<ShortTonsQtyDeliveryToday>%@</ShortTonsQtyDeliveryToday>", [NSString stringWithFormat: @"%@", self.ShortTonsQtyDeliveryToday]];
		if (self.ShortTonsQtyOrdered != nil) [s appendFormat: @"<ShortTonsQtyOrdered>%@</ShortTonsQtyOrdered>", [NSString stringWithFormat: @"%@", self.ShortTonsQtyOrdered]];
		if (self.Signature != nil) [s appendFormat: @"<Signature>%@</Signature>", [Soap getBase64String: self.Signature]];
		if (self.SpecialInstructions != nil) [s appendFormat: @"<SpecialInstructions>%@</SpecialInstructions>", [[self.SpecialInstructions stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.StonePrice != nil) [s appendFormat: @"<StonePrice>%@</StonePrice>", [NSString stringWithFormat: @"%@", self.StonePrice]];
		if (self.StoneRate != nil) [s appendFormat: @"<StoneRate>%@</StoneRate>", [NSString stringWithFormat: @"%@", self.StoneRate]];
		if (self.TareWt != nil) [s appendFormat: @"<TareWt>%@</TareWt>", [NSString stringWithFormat: @"%@", self.TareWt]];
		if (self.TicketDate != nil) [s appendFormat: @"<TicketDate>%@</TicketDate>", [[self.TicketDate stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.TicketNumber != nil) [s appendFormat: @"<TicketNumber>%@</TicketNumber>", [[self.TicketNumber stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.TicketTime != nil) [s appendFormat: @"<TicketTime>%@</TicketTime>", [[self.TicketTime stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Total != nil) [s appendFormat: @"<Total>%@</Total>", [NSString stringWithFormat: @"%@", self.Total]];
		if (self.TruckNumber != nil) [s appendFormat: @"<TruckNumber>%@</TruckNumber>", [[self.TruckNumber stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.TruckOwner != nil) [s appendFormat: @"<TruckOwner>%@</TruckOwner>", [[self.TruckOwner stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<TurnAroundMins>%@</TurnAroundMins>", [NSString stringWithFormat: @"%i", self.TurnAroundMins]];
		if (self.UOM != nil) [s appendString: [self.UOM serialize: @"UOM"]];
		if (self.Warning1 != nil) [s appendFormat: @"<Warning1>%@</Warning1>", [[self.Warning1 stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Warning2 != nil) [s appendFormat: @"<Warning2>%@</Warning2>", [[self.Warning2 stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.WaterIndicator != nil) [s appendFormat: @"<WaterIndicator>%@</WaterIndicator>", [[self.WaterIndicator stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Weighmaster != nil) [s appendFormat: @"<Weighmaster>%@</Weighmaster>", [[self.Weighmaster stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self._TicketDateTime != nil) [s appendFormat: @"<_TicketDateTime>%@</_TicketDateTime>", [Soap getDateString: self._TicketDateTime]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[SDZTicket class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}
	
	- (void) dealloc
	{
		self.Copy = nil;
		self.CopyReprint = nil;
		self.CustomerAcctNumber = nil;
		self.CustomerAddress = nil;
		self.DeliveryInstructions = nil;
		self.FuelSurcharge = nil;
		self.GrossWt = nil;
		self.HaulCharge = nil;
		self.HaulIndicator = nil;
		self.HaulRate = nil;
		self.HaulerName = nil;
		self.HaulerNumber = nil;
		self.JobContact = nil;
		self.JobPhone = nil;
		self.Latitude = nil;
		self.LoadsForYear = nil;
		self.LocationName = nil;
		self.Longitude = nil;
		self.LotSample = nil;
		self.MaxGross = nil;
		self.MetricTonsLoadsToday = nil;
		self.MetricTonsQtyDelivered = nil;
		self.MetricTonsQtyDeliveryToday = nil;
		self.MetricTonsQtyOrdered = nil;
		self.NetTons = nil;
		self.NetTonsMetric = nil;
		self.NetWeight = nil;
		self.OrderID = nil;
		self.OrderPriceIndicator = nil;
		self.OrderQtyIndicator = nil;
		self.OrderQtyIndicatorName = nil;
		self.OrderStateJob = nil;
		self.Plant = nil;
		self.PrintPrice = nil;
		self.PrintShort = nil;
		self.ProductCertification = nil;
		self.ProductCertificationDefault = nil;
		self.ProductCode = nil;
		self.ProductDescription = nil;
		self.ProjectDescription = nil;
		self.ProjectID = nil;
		self.PurchaseOrder = nil;
		self.SalesTax = nil;
		self.ScaleUsed = nil;
		self.ShortTonsLoadsToday = nil;
		self.ShortTonsQtyDelivered = nil;
		self.ShortTonsQtyDeliveryToday = nil;
		self.ShortTonsQtyOrdered = nil;
		self.Signature = nil;
		self.SpecialInstructions = nil;
		self.StonePrice = nil;
		self.StoneRate = nil;
		self.TareWt = nil;
		self.TicketDate = nil;
		self.TicketNumber = nil;
		self.TicketTime = nil;
		self.Total = nil;
		self.TruckNumber = nil;
		self.TruckOwner = nil;
		self.UOM = nil;
		self.Warning1 = nil;
		self.Warning2 = nil;
		self.WaterIndicator = nil;
		self.Weighmaster = nil;
		self._TicketDateTime = nil;
    self.Signature1 = nil;
    self.Signature2 = nil;
    self.Signature3 = nil;
    self.Signature4 = nil;
    self.Notes = nil;
		[super dealloc];
	}

@end
