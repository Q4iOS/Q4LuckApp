/*
	SDZArrayOfScheduleInfo.h
	The implementation of properties and methods for the SDZArrayOfScheduleInfo array.
	Generated by SudzC.com
*/
#import "SDZArrayOfScheduleInfo.h"

#import "SDZScheduleInfo.h"
@implementation SDZArrayOfScheduleInfo

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[[self alloc] initWithNode: node] autorelease];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				SDZScheduleInfo* value = [[SDZScheduleInfo createWithNode: child] object];
				if(value != nil) {
					[self addObject: value];
				}
			}
		}
		return self;
	}
	
	+ (NSMutableString*) serialize: (NSArray*) array
	{
		NSMutableString* s = [NSMutableString string];
		for(id item in array) {
			[s appendString: [item serialize: @"ScheduleInfo"]];
		}
		return s;
	}
@end