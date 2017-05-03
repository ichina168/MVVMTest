//
//  Config.h
//  MVVMTest
//
//

#ifndef MVVMTest_Config_h
#define MVVMTest_Config_h

//定义返回请求数据的block类型
typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^NetWorkBlock)(BOOL netConnetState);

#define kTimeOutInterval 30

#define DDLog(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

//accessToken
#define ACCESSTOKEN @"2.00NofgBD0L1k4pc584f79cc48SKGdD"

//请求登陆接口
#define REQUESTPUBLICURL @"http://10.3.90.4:8060/Member/login_v320"
//@"http://10.3.90.4:8060/Member/login_v320"

#define SOURCE @"source"
#define TOKEN @"phone"
#define COUNT @"password"

#define UserInfoVC  @"UserInfoViewController"

#endif
