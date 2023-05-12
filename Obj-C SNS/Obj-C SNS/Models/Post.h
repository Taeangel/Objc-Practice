//
//  Post.h
//  Obj-C SNS
//
//  Created by song on 2023/05/12.
//

#import <Foundation/Foundation.h>
@import FirebaseCore;
@import FirebaseFirestore;

NS_ASSUME_NONNULL_BEGIN

@interface Post : NSObject

// nonatomic 빠른대신 쓰레드에 안전하지 않다
// copy 이데이터를 복사도 할 수도 있다
@property (nonatomic, nullable, copy) NSString * identifier;
@property (nonatomic, nullable, copy) NSString * content;
@property (nonatomic, nullable, copy) NSString * title;
@property (nonatomic, nullable, copy) NSString * image;
@property (nonatomic, nullable, copy) NSDate * createdAt;
@property (nonatomic, nullable, copy) NSDate * updatedAt;

@property (nonatomic, nullable, copy) FIRDocumentReference * firebaseRef;

// MARK: 스냅샷으로 생성자 만들기
- (instancetype) initWithSnapshot: (FIRDocumentSnapshot *)document;

// MARK: 스냅샷을 받으면 생성된 포스트 배열을 반환
+ (NSMutableArray<Post *> *)fromFIRQureySnapshot:(FIRQuerySnapshot *) snapshot;

@end

NS_ASSUME_NONNULL_END
