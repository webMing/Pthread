#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>

int main(int argc, char *argv[])
{
	fprintf(stderr, "EACCESS: %s\n",strerror(EACCES));
	errno = ENOENT;
	//errno = EACCES;
	perror(argv[0]);
	exit(0);
}



