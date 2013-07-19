//
//  DBLScheduleInfo.h
//  DBL
//
//  Created by Kelvin Quiroz on 5/24/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DBLScheduleInfo : NSManagedObject

@property (nonatomic, retain) NSString * customerName;
@property (nonatomic, retain) NSString * locationName;
@property (nonatomic, retain) NSString * orderID;
@property (nonatomic, retain) NSString * productID;
@property (nonatomic, retain) NSDecimalNumber * longitude;
@property (nonatomic, retain) NSDecimalNumber * latitude;
@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) NSString * qtyType;
@property (nonatomic, retain) NSDecimalNumber * qty;
@property (nonatomic, retain) NSDate * endTime;
@property (nonatomic, retain) NSNumber * locationCode;
@property (nonatomic, retain) NSDate * startTime;
@property (nonatomic, retain) NSNumber * allowselfticket;

@end
