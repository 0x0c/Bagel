//
//  BagelDevice.h
//  BagelDesktop
//
//  Created by Yagiz Gurgul on 08/05/2017.
//  Copyright © 2017 Yagiz Lab. All rights reserved.
//

#import "BagelBaseModel.h"

@interface BagelDevice : NSObject <BagelBaseModelProtocol>

@property (nonatomic,strong) NSString* deviceName;
@property (nonatomic,strong) NSString* deviceDescription;

@end
