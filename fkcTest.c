#include "types.h"
#include "stat.h"
#include "user.h"
int
main(int argc, char * argv[])
{
   int count;
   //Get the count when first starting
   count = fkc(1);
   printf(1, "number of forks program starts: %d\n", count);

   //create two children and get the count again
   if (fork() == 0) exit(); else wait();
   if (fork() == 0) exit(); else wait();
   count = fkc(1);
   printf(1, "number of forks after two more forks: %d\n", count);

   //clear the count 
   count = fkc(0);
   printf(1, "number of forks after fork count cleared: %d\n", count);

   //create three more children and get the count again
   if (fork() == 0) exit(); else wait();
   if (fork() == 0) exit(); else wait();
   if (fork() == 0) exit(); else wait();
   count = fkc(1);
   printf(1, "number of forks after three more forks: %d\n", count);

   //done
   exit();
}
