//
//  ViewController.m
//  wjIDRecognize
//
//  Created by gouzi on 2017/3/9.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"
#import "NSString+STRegex.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 暂时还没有位数的限制，对于这种 “1@qq.com” 这种也判定为邮箱，而理论是上确实是一个邮箱。
    NSString *mailStr = @"1@qq.com";
    BOOL isMail = [mailStr isValidEmail];
    NSLog(@"is mail or not : %d", isMail);
    
    // 这里的不能再前面加上汉字: 例如：“川F.22222” 这样的字符串不能识别，只能别到汉字之后的内容
    NSString *carNoStr = @"FS2222";
    BOOL isCarNo = [carNoStr isValidCarNo];
    NSLog(@"is car number or not : %d", isCarNo);
    
    // 只能判断手机号码，座机号码不能判断
    NSString *phoneNoStr = @"17777777777";
    BOOL isPhoneNo = [phoneNoStr isValidPhoneNum];
    NSLog(@"is phone number : %d", isPhoneNo);
    
    // 对于只有加上的 `http://` 才能判定为是一个网站的url，很正常
    NSString *netUrlStr = @"http://www.baidu.com";
    BOOL isUrl = [netUrlStr isValidUrl];
    NSLog(@"is net url : %d", isUrl);
    
    // 邮编的测试
    NSString *postCodeStr = @"618000";
    BOOL isPostCode = [postCodeStr isValidPostalcode];
    NSLog(@"is post code or not : %d", isPostCode);
    
    // 这里的汉字检测是可以一个单独的汉字也可以是词语等，但是中间插入一些标点符号就不能识别为汉字
    NSString *chineseCharacterStr = @"喊";
    BOOL isChineseCharacter = [chineseCharacterStr isValidChinese];
    NSLog(@"is chines character or not : %d", isChineseCharacter);
    
    // 很希望有xxx.local也可以识别，但是不行
    NSString *ipStr = @"192.168.2.7";
    BOOL isIp = [ipStr isValidIP];
    NSLog(@"is ip or not : %d", isIp);
    
    // 检测身份证号码
    NSString *idCardNoStr = @"511321190006063";
    BOOL isIdCardNo = [idCardNoStr isValidIdCardNum];
    NSLog(@"is id card number or not : %d", isIdCardNo);
    
    // 特殊字符串的设置
    NSString *specialStr = @"1wasd2ewr23是";
    BOOL isMatches = [specialStr isValidWithMinLenth:6 maxLenth:16 containChinese:YES firstCannotBeDigtal:NO];
    NSLog(@"is matches or not : %d", isMatches);
    
    NSString *special = @"12sdasdasdass是";
    BOOL isMatch = [special isValidWithMinLenth:6 maxLenth:26 containChinese:YES containDigtal:YES containLetter:YES containOtherCharacter:@"dsss" firstCannotBeDigtal:NO];
    NSLog(@"is match : %d", isMatch);

    // 去掉两端空格和换行符
    NSString *spaceStr = @"   asdasdas\n asdasd  s\n   ";
    NSString *str = [spaceStr stringByTrimmingBlank];
    NSLog(@"str is : %@", str);
    
    // 移除html的格式
    NSString *htmlStr = @"<br> asdasdasda   asdasdas  </br>";
    NSString *html = [htmlStr removeHtmlFormat];
    NSLog(@"html is %@", html);
    
}






@end
