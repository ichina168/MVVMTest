//
//  ViewModelClass.h
//  MVVMTest
//
//

//Kicking off network or database requests
//Determining when information should be hidden or shown
//Date and number formatting
//Localization

#import <Foundation/Foundation.h>

@interface GTViewModel : NSObject

@property (strong, nonatomic) ReturnValueBlock returnBlock;



//获取网络的链接状态
-(void) netWorkStateWithNetConnectBlock: (NetWorkBlock) netConnectBlock WithURlStr: (NSString *) strURl;

// 传入交互的Block块
-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock;
@end
