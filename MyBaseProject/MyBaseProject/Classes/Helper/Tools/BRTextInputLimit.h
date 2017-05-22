//
//  BRTextInputLimit.h
//  MyBaseProject
//
//  Created by 任波 on 2017/5/22.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Singleton.h"
/**
 *  该工具可以用来限制UITextView和UITextField的文本输入长度
 *  使用：无需导入头文件，运行时执行
 *      [_nameTF setValue:@10 forKey:@"limit"]; // 限制输入框的字数
 *
 */
@interface UITextField (limit)

@end

@interface UITextView (limit)

@end


@interface BRTextInputLimit : NSObject

singleton_interface(BRTextInputLimit)

@end
