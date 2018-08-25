#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <string.h>
#include <unistd.h>

#define MAXLINE 20

int main(void)
{

  char buf[MAXLINE]; /*from apue.h*/
  pid_t pid;
  int status;
  
  printf("%% "); /*print prompt (printf requires %% to printf %)*/
  while (fgets(buf, MAXLINE, stdin) != NULL )
  {
	if (buf[strlen(buf) -1] == '\n')
		buf[strlen(buf) -1] = 0; /*replace newline with null*/
	if ((pid = fork()) < 0)
	{
        	printf("fork error!");
		exit(0);
	}
	else if (pid == 0) /*child*/
        {
		execlp(buf,buf,(char *)0);
		err_ret("couldn`t excute:%s",buf);
		exit(127);
	}
	
        /*parent*/
	if ( (pid = waitpid(pid, &status, 0)) < 0)
		printf("waitpid error!");
	printf("%% ");

  }
  exit(0);
}
