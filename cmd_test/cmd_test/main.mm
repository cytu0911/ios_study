//
//  main.m
//  cmd_test
//
//  Created by 涂成玉 on 2021/5/23.
//  Copyright © 2021年 cytu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef int (^add_type)(int , int );

int test_fun(int a, int b)
{
    return  (a+b);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World! \n \n I am fine ");
        
        typedef  int (^blk_t) (int);
        
        int  tmp_v1 = 10;
        int tmp_v2 = 20;
        
        add_type add = ^(int a,int b) { return tmp_v1+tmp_v2; };
        
        tmp_v1 = 5;
        tmp_v2 = 9;
        
        NSLog(@"a+b = %d", add(3,4) );
        
        printf("asfasdfas\n");
    }
    return 0;
}
