//
//  ch0_1.c
//  Pthread
//
//  Created by Stephanie on 2018/8/25.
//  Copyright © 2018年 Stephanie. All rights reserved.
//

#include <stdio.h>
#include <dirent.h>
#include <stdlib.h>

// 如果想使用exit(0) 必须包含 stdlib 头文件
int main(int argc, char *argv[]) 
{
	DIR *dp;
	struct dirent *dirp;
	
	if (argc != 2)
	{
		printf("Usage: ls directory name");
		exit(0);
        }

	if ( (dp = opendir(argv[1])) == NULL )
		printf("Can`t open dir:%s",argv[1]);

	//调用readdir()来读取dp中的每个目录项
	while((dirp = readdir(dp)) != NULL)
		printf("%s\n",dirp->d_name);

	closedir(dp);

	exit(0);

}
