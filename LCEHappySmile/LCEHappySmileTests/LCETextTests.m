//
//  LCETextTests.m
//  LCEHappySmile
//
//  Created by 刘随义 on 16/5/21.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LCETextApi.h"
#import "YTKNetworkConfig.h"

@interface LCETextTests : XCTestCase

@end

@implementation LCETextTests

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
    LCETextApi *api = [[LCETextApi alloc] initWithPage:1];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        
        XCTAssertNotNil(request.responseJSONObject, @"request.responseJSONObject nil");
        XCTAssertNotNil(request, @"request nil");
        XCTAssertEqual(request.responseStatusCode, 200, @"status != 200");
        
//        LCEPictureModel *model = [LCEPictureModel changeResponseJSONObject:request.responseJSONObject];
//        LCEPictureContentModel *contentModel = model.showapi_res_body;
//        NSArray *array = contentModel.contentlist;
//        LCEPictureListModel *listModel = array[0];
//        
//        NSLog(@"%@", listModel.img);
        
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
