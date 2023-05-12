//
//  Post.m
//  Obj-C SNS
//
//  Created by song on 2023/05/12.
//

#import "Post.h"

@implementation Post

- (instancetype)initWithSnapshot:(FIRDocumentSnapshot *)document {
  
  NSLog(@"%s , line: %d, %@", __func__, __LINE__, document.documentID);
  
  self = [super init];
  
  if (self != nil) {
    
    _firebaseRef = document.reference;
    
    _identifier = document.documentID;
    
    _title = document.data[@"title"] ? : @"";
    
    _content = document.data[@"content"] ? : @"";
    
    _image = document.data[@"image"] ? : @"";
    
    if (document.data[@"created_at"]) {
      _createdAt = [(FIRTimestamp *) document.data[@"created_at"] dateValue];
    }
    
    if (document.data[@"updated_at"]) {
      _updatedAt = [(FIRTimestamp *) document.data[@"updated_at"] dateValue];
    }
  }
  return  self ;
}

+ (NSMutableArray<Post *> *)fromFIRQureySnapshot:(FIRQuerySnapshot *)snapshot {
  
  NSMutableArray<Post *> * postList = [[NSMutableArray alloc]init];
  
  for (FIRDocumentSnapshot *document in snapshot.documents) {
    
    
    Post * postItem = [[Post alloc] initWithSnapshot:document];
    [postList addObject:postItem];
  }
  
  return  postList;
}

@end

