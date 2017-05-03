//
//  ViewModelClass.m
//  MVVMTest
//
//

#import "GTViewModel.h"


@implementation GTViewModel

#pragma 获取网络可到达状态
-(void) netWorkStateWithNetConnectBlock: (NetWorkBlock) netConnectBlock WithURlStr: (NSString *) strURl;
{
    BOOL netState = [NetRequestClass netWorkReachabilityWithURLString:strURl];
    netConnectBlock(netState);
}

#pragma 接收穿过来的block
-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock

{
    _returnBlock = returnBlock;
}

@end
