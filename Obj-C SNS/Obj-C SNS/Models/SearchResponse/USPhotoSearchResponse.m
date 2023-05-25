//
//  USPhotoSearchResponse.m
//  Obj-C SNS
//
//  Created by song on 2023/05/13.
//

#import "USPhotoSearchResponse.h"

@implementation USPhotoSearchResponse


- (id)initWithDictionary:(NSDictionary<NSString *,id> * ) jsonDictionary {
  self = [super init];
  
  if (self) {
    _total = [jsonDictionary[@"total"] integerValue];
    _totalPages = [jsonDictionary[@"totoal_page"] integerValue];
    
    
    NSMutableArray<USPhoto*>* photoList = [[NSMutableArray alloc] init];
    
    for (NSDictionary* aPhotoDictionary in jsonDictionary[@"results"]) {
      USPhoto* aPhoto = [[USPhoto alloc] initWithDictionary: aPhotoDictionary];
      [photoList addObject:aPhoto];
    }
    _result = photoList; 
  }
  
  return  self;
};

@end
