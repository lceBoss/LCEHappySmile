//
//  LCEVideoTests.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/21.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LCEVideoApi.h"
#import "LCEVideoModel.h"
#import "LCEVideoSidListModel.h"
#import "LCEVideoListModel.h"

@interface LCEVideoTests : XCTestCase

@end

@implementation LCEVideoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Picture request"];
    LCEVideoApi *api = [[LCEVideoApi alloc] initWithPage:1];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        
        XCTAssertNotNil(request.responseJSONObject, @"request.responseJSONObject nil");
        XCTAssertNotNil(request, @"request nil");
        XCTAssertEqual(request.responseStatusCode, 200, @"status != 200");
        
        LCEVideoModel *model = [LCEVideoModel changeResponseJSONObject:request.responseJSONObject];
        NSArray *array = model.videoList;
        
        LCEVideoListModel *listModel = array[0];
        
        NSLog(@"%@", listModel.title);
        
        [expectation fulfill];
        
    } failure:^(__kindof YTKBaseRequest *request) {
        
        XCTAssertNotNil(request, @"request nil");
        
    }];
    
    [self waitForExpectationsWithTimeout:10 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
