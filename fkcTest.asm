
_fkcTest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"
int
main(int argc, char * argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
   int count;
   //Get the count when first starting
   count = fkc(1);
   9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10:	e8 b5 03 00 00       	call   3ca <fkc>
   printf(1, "number of forks program starts: %d\n", count);
  15:	c7 44 24 04 e8 07 00 	movl   $0x7e8,0x4(%esp)
  1c:	00 
  1d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  24:	89 44 24 08          	mov    %eax,0x8(%esp)
  28:	e8 53 04 00 00       	call   480 <printf>

   //create two children and get the count again
   if (fork() == 0) exit(); else wait();
  2d:	e8 e8 02 00 00       	call   31a <fork>
  32:	85 c0                	test   %eax,%eax
  34:	74 13                	je     49 <main+0x49>
  36:	e8 ef 02 00 00       	call   32a <wait>
  3b:	90                   	nop
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   if (fork() == 0) exit(); else wait();
  40:	e8 d5 02 00 00       	call   31a <fork>
  45:	85 c0                	test   %eax,%eax
  47:	75 05                	jne    4e <main+0x4e>
   if (fork() == 0) exit(); else wait();
   count = fkc(1);
   printf(1, "number of forks after three more forks: %d\n", count);

   //done
   exit();
  49:	e8 d4 02 00 00       	call   322 <exit>
  4e:	66 90                	xchg   %ax,%ax
   if (fork() == 0) exit(); else wait();
  50:	e8 d5 02 00 00       	call   32a <wait>
   count = fkc(1);
  55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  5c:	e8 69 03 00 00       	call   3ca <fkc>
   printf(1, "number of forks after two more forks: %d\n", count);
  61:	c7 44 24 04 0c 08 00 	movl   $0x80c,0x4(%esp)
  68:	00 
  69:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  70:	89 44 24 08          	mov    %eax,0x8(%esp)
  74:	e8 07 04 00 00       	call   480 <printf>
   count = fkc(0);
  79:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  80:	e8 45 03 00 00       	call   3ca <fkc>
   printf(1, "number of forks after fork count cleared: %d\n", count);
  85:	c7 44 24 04 38 08 00 	movl   $0x838,0x4(%esp)
  8c:	00 
  8d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  94:	89 44 24 08          	mov    %eax,0x8(%esp)
  98:	e8 e3 03 00 00       	call   480 <printf>
   if (fork() == 0) exit(); else wait();
  9d:	e8 78 02 00 00       	call   31a <fork>
  a2:	85 c0                	test   %eax,%eax
  a4:	74 a3                	je     49 <main+0x49>
  a6:	e8 7f 02 00 00       	call   32a <wait>
  ab:	90                   	nop
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   if (fork() == 0) exit(); else wait();
  b0:	e8 65 02 00 00       	call   31a <fork>
  b5:	85 c0                	test   %eax,%eax
  b7:	74 90                	je     49 <main+0x49>
  b9:	e8 6c 02 00 00       	call   32a <wait>
  be:	66 90                	xchg   %ax,%ax
   if (fork() == 0) exit(); else wait();
  c0:	e8 55 02 00 00       	call   31a <fork>
  c5:	85 c0                	test   %eax,%eax
  c7:	74 80                	je     49 <main+0x49>
  c9:	e8 5c 02 00 00       	call   32a <wait>
   count = fkc(1);
  ce:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d5:	e8 f0 02 00 00       	call   3ca <fkc>
   printf(1, "number of forks after three more forks: %d\n", count);
  da:	c7 44 24 04 68 08 00 	movl   $0x868,0x4(%esp)
  e1:	00 
  e2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e9:	89 44 24 08          	mov    %eax,0x8(%esp)
  ed:	e8 8e 03 00 00       	call   480 <printf>
  f2:	e9 52 ff ff ff       	jmp    49 <main+0x49>
  f7:	66 90                	xchg   %ax,%ax
  f9:	66 90                	xchg   %ax,%ax
  fb:	66 90                	xchg   %ax,%ax
  fd:	66 90                	xchg   %ax,%ax
  ff:	90                   	nop

00000100 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 45 08             	mov    0x8(%ebp),%eax
 106:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 109:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 10a:	89 c2                	mov    %eax,%edx
 10c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 110:	83 c1 01             	add    $0x1,%ecx
 113:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 117:	83 c2 01             	add    $0x1,%edx
 11a:	84 db                	test   %bl,%bl
 11c:	88 5a ff             	mov    %bl,-0x1(%edx)
 11f:	75 ef                	jne    110 <strcpy+0x10>
    ;
  return os;
}
 121:	5b                   	pop    %ebx
 122:	5d                   	pop    %ebp
 123:	c3                   	ret    
 124:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 12a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000130 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 55 08             	mov    0x8(%ebp),%edx
 136:	53                   	push   %ebx
 137:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 13a:	0f b6 02             	movzbl (%edx),%eax
 13d:	84 c0                	test   %al,%al
 13f:	74 2d                	je     16e <strcmp+0x3e>
 141:	0f b6 19             	movzbl (%ecx),%ebx
 144:	38 d8                	cmp    %bl,%al
 146:	74 0e                	je     156 <strcmp+0x26>
 148:	eb 2b                	jmp    175 <strcmp+0x45>
 14a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 150:	38 c8                	cmp    %cl,%al
 152:	75 15                	jne    169 <strcmp+0x39>
    p++, q++;
 154:	89 d9                	mov    %ebx,%ecx
 156:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 159:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 15c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 15f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 163:	84 c0                	test   %al,%al
 165:	75 e9                	jne    150 <strcmp+0x20>
 167:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 169:	29 c8                	sub    %ecx,%eax
}
 16b:	5b                   	pop    %ebx
 16c:	5d                   	pop    %ebp
 16d:	c3                   	ret    
 16e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 171:	31 c0                	xor    %eax,%eax
 173:	eb f4                	jmp    169 <strcmp+0x39>
 175:	0f b6 cb             	movzbl %bl,%ecx
 178:	eb ef                	jmp    169 <strcmp+0x39>
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000180 <strlen>:

uint
strlen(const char *s)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 186:	80 39 00             	cmpb   $0x0,(%ecx)
 189:	74 12                	je     19d <strlen+0x1d>
 18b:	31 d2                	xor    %edx,%edx
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	83 c2 01             	add    $0x1,%edx
 193:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 197:	89 d0                	mov    %edx,%eax
 199:	75 f5                	jne    190 <strlen+0x10>
    ;
  return n;
}
 19b:	5d                   	pop    %ebp
 19c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 19d:	31 c0                	xor    %eax,%eax
}
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret    
 1a1:	eb 0d                	jmp    1b0 <memset>
 1a3:	90                   	nop
 1a4:	90                   	nop
 1a5:	90                   	nop
 1a6:	90                   	nop
 1a7:	90                   	nop
 1a8:	90                   	nop
 1a9:	90                   	nop
 1aa:	90                   	nop
 1ab:	90                   	nop
 1ac:	90                   	nop
 1ad:	90                   	nop
 1ae:	90                   	nop
 1af:	90                   	nop

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 55 08             	mov    0x8(%ebp),%edx
 1b6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bd:	89 d7                	mov    %edx,%edi
 1bf:	fc                   	cld    
 1c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c2:	89 d0                	mov    %edx,%eax
 1c4:	5f                   	pop    %edi
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    
 1c7:	89 f6                	mov    %esi,%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	53                   	push   %ebx
 1d7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 1da:	0f b6 18             	movzbl (%eax),%ebx
 1dd:	84 db                	test   %bl,%bl
 1df:	74 1d                	je     1fe <strchr+0x2e>
    if(*s == c)
 1e1:	38 d3                	cmp    %dl,%bl
 1e3:	89 d1                	mov    %edx,%ecx
 1e5:	75 0d                	jne    1f4 <strchr+0x24>
 1e7:	eb 17                	jmp    200 <strchr+0x30>
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1f0:	38 ca                	cmp    %cl,%dl
 1f2:	74 0c                	je     200 <strchr+0x30>
  for(; *s; s++)
 1f4:	83 c0 01             	add    $0x1,%eax
 1f7:	0f b6 10             	movzbl (%eax),%edx
 1fa:	84 d2                	test   %dl,%dl
 1fc:	75 f2                	jne    1f0 <strchr+0x20>
      return (char*)s;
  return 0;
 1fe:	31 c0                	xor    %eax,%eax
}
 200:	5b                   	pop    %ebx
 201:	5d                   	pop    %ebp
 202:	c3                   	ret    
 203:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 215:	31 f6                	xor    %esi,%esi
{
 217:	53                   	push   %ebx
 218:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 21b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 21e:	eb 31                	jmp    251 <gets+0x41>
    cc = read(0, &c, 1);
 220:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 227:	00 
 228:	89 7c 24 04          	mov    %edi,0x4(%esp)
 22c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 233:	e8 02 01 00 00       	call   33a <read>
    if(cc < 1)
 238:	85 c0                	test   %eax,%eax
 23a:	7e 1d                	jle    259 <gets+0x49>
      break;
    buf[i++] = c;
 23c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 240:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 242:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 245:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 247:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 24b:	74 0c                	je     259 <gets+0x49>
 24d:	3c 0a                	cmp    $0xa,%al
 24f:	74 08                	je     259 <gets+0x49>
  for(i=0; i+1 < max; ){
 251:	8d 5e 01             	lea    0x1(%esi),%ebx
 254:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 257:	7c c7                	jl     220 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 259:	8b 45 08             	mov    0x8(%ebp),%eax
 25c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 260:	83 c4 2c             	add    $0x2c,%esp
 263:	5b                   	pop    %ebx
 264:	5e                   	pop    %esi
 265:	5f                   	pop    %edi
 266:	5d                   	pop    %ebp
 267:	c3                   	ret    
 268:	90                   	nop
 269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000270 <stat>:

int
stat(const char *n, struct stat *st)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	56                   	push   %esi
 274:	53                   	push   %ebx
 275:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 278:	8b 45 08             	mov    0x8(%ebp),%eax
 27b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 282:	00 
 283:	89 04 24             	mov    %eax,(%esp)
 286:	e8 d7 00 00 00       	call   362 <open>
  if(fd < 0)
 28b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 28d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 28f:	78 27                	js     2b8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 291:	8b 45 0c             	mov    0xc(%ebp),%eax
 294:	89 1c 24             	mov    %ebx,(%esp)
 297:	89 44 24 04          	mov    %eax,0x4(%esp)
 29b:	e8 da 00 00 00       	call   37a <fstat>
  close(fd);
 2a0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2a3:	89 c6                	mov    %eax,%esi
  close(fd);
 2a5:	e8 a0 00 00 00       	call   34a <close>
  return r;
 2aa:	89 f0                	mov    %esi,%eax
}
 2ac:	83 c4 10             	add    $0x10,%esp
 2af:	5b                   	pop    %ebx
 2b0:	5e                   	pop    %esi
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    
 2b3:	90                   	nop
 2b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2bd:	eb ed                	jmp    2ac <stat+0x3c>
 2bf:	90                   	nop

000002c0 <atoi>:

int
atoi(const char *s)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2c6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2c7:	0f be 11             	movsbl (%ecx),%edx
 2ca:	8d 42 d0             	lea    -0x30(%edx),%eax
 2cd:	3c 09                	cmp    $0x9,%al
  n = 0;
 2cf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 2d4:	77 17                	ja     2ed <atoi+0x2d>
 2d6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2d8:	83 c1 01             	add    $0x1,%ecx
 2db:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2de:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 2e2:	0f be 11             	movsbl (%ecx),%edx
 2e5:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2e8:	80 fb 09             	cmp    $0x9,%bl
 2eb:	76 eb                	jbe    2d8 <atoi+0x18>
  return n;
}
 2ed:	5b                   	pop    %ebx
 2ee:	5d                   	pop    %ebp
 2ef:	c3                   	ret    

000002f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2f0:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2f1:	31 d2                	xor    %edx,%edx
{
 2f3:	89 e5                	mov    %esp,%ebp
 2f5:	56                   	push   %esi
 2f6:	8b 45 08             	mov    0x8(%ebp),%eax
 2f9:	53                   	push   %ebx
 2fa:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2fd:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 300:	85 db                	test   %ebx,%ebx
 302:	7e 12                	jle    316 <memmove+0x26>
 304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 308:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 30c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 30f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 312:	39 da                	cmp    %ebx,%edx
 314:	75 f2                	jne    308 <memmove+0x18>
  return vdst;
}
 316:	5b                   	pop    %ebx
 317:	5e                   	pop    %esi
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    

0000031a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 31a:	b8 01 00 00 00       	mov    $0x1,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <exit>:
SYSCALL(exit)
 322:	b8 02 00 00 00       	mov    $0x2,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <wait>:
SYSCALL(wait)
 32a:	b8 03 00 00 00       	mov    $0x3,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <pipe>:
SYSCALL(pipe)
 332:	b8 04 00 00 00       	mov    $0x4,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <read>:
SYSCALL(read)
 33a:	b8 05 00 00 00       	mov    $0x5,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <write>:
SYSCALL(write)
 342:	b8 10 00 00 00       	mov    $0x10,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <close>:
SYSCALL(close)
 34a:	b8 15 00 00 00       	mov    $0x15,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <kill>:
SYSCALL(kill)
 352:	b8 06 00 00 00       	mov    $0x6,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <exec>:
SYSCALL(exec)
 35a:	b8 07 00 00 00       	mov    $0x7,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <open>:
SYSCALL(open)
 362:	b8 0f 00 00 00       	mov    $0xf,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <mknod>:
SYSCALL(mknod)
 36a:	b8 11 00 00 00       	mov    $0x11,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <unlink>:
SYSCALL(unlink)
 372:	b8 12 00 00 00       	mov    $0x12,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <fstat>:
SYSCALL(fstat)
 37a:	b8 08 00 00 00       	mov    $0x8,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <link>:
SYSCALL(link)
 382:	b8 13 00 00 00       	mov    $0x13,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <mkdir>:
SYSCALL(mkdir)
 38a:	b8 14 00 00 00       	mov    $0x14,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <chdir>:
SYSCALL(chdir)
 392:	b8 09 00 00 00       	mov    $0x9,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <dup>:
SYSCALL(dup)
 39a:	b8 0a 00 00 00       	mov    $0xa,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <getpid>:
SYSCALL(getpid)
 3a2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <sbrk>:
SYSCALL(sbrk)
 3aa:	b8 0c 00 00 00       	mov    $0xc,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <sleep>:
SYSCALL(sleep)
 3b2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <uptime>:
SYSCALL(uptime)
 3ba:	b8 0e 00 00 00       	mov    $0xe,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <hw>:
SYSCALL(hw)
 3c2:	b8 16 00 00 00       	mov    $0x16,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <fkc>:
SYSCALL(fkc)
 3ca:	b8 17 00 00 00       	mov    $0x17,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    
 3d2:	66 90                	xchg   %ax,%ax
 3d4:	66 90                	xchg   %ax,%ax
 3d6:	66 90                	xchg   %ax,%ax
 3d8:	66 90                	xchg   %ax,%ax
 3da:	66 90                	xchg   %ax,%ax
 3dc:	66 90                	xchg   %ax,%ax
 3de:	66 90                	xchg   %ax,%ax

000003e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	89 c6                	mov    %eax,%esi
 3e7:	53                   	push   %ebx
 3e8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3ee:	85 db                	test   %ebx,%ebx
 3f0:	74 09                	je     3fb <printint+0x1b>
 3f2:	89 d0                	mov    %edx,%eax
 3f4:	c1 e8 1f             	shr    $0x1f,%eax
 3f7:	84 c0                	test   %al,%al
 3f9:	75 75                	jne    470 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3fb:	89 d0                	mov    %edx,%eax
  neg = 0;
 3fd:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 404:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 407:	31 ff                	xor    %edi,%edi
 409:	89 ce                	mov    %ecx,%esi
 40b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 40e:	eb 02                	jmp    412 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 410:	89 cf                	mov    %ecx,%edi
 412:	31 d2                	xor    %edx,%edx
 414:	f7 f6                	div    %esi
 416:	8d 4f 01             	lea    0x1(%edi),%ecx
 419:	0f b6 92 9b 08 00 00 	movzbl 0x89b(%edx),%edx
  }while((x /= base) != 0);
 420:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 422:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 425:	75 e9                	jne    410 <printint+0x30>
  if(neg)
 427:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 42a:	89 c8                	mov    %ecx,%eax
 42c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 42f:	85 d2                	test   %edx,%edx
 431:	74 08                	je     43b <printint+0x5b>
    buf[i++] = '-';
 433:	8d 4f 02             	lea    0x2(%edi),%ecx
 436:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 43b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 43e:	66 90                	xchg   %ax,%ax
 440:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 445:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 448:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 44f:	00 
 450:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 454:	89 34 24             	mov    %esi,(%esp)
 457:	88 45 d7             	mov    %al,-0x29(%ebp)
 45a:	e8 e3 fe ff ff       	call   342 <write>
  while(--i >= 0)
 45f:	83 ff ff             	cmp    $0xffffffff,%edi
 462:	75 dc                	jne    440 <printint+0x60>
    putc(fd, buf[i]);
}
 464:	83 c4 4c             	add    $0x4c,%esp
 467:	5b                   	pop    %ebx
 468:	5e                   	pop    %esi
 469:	5f                   	pop    %edi
 46a:	5d                   	pop    %ebp
 46b:	c3                   	ret    
 46c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 470:	89 d0                	mov    %edx,%eax
 472:	f7 d8                	neg    %eax
    neg = 1;
 474:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 47b:	eb 87                	jmp    404 <printint+0x24>
 47d:	8d 76 00             	lea    0x0(%esi),%esi

00000480 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 484:	31 ff                	xor    %edi,%edi
{
 486:	56                   	push   %esi
 487:	53                   	push   %ebx
 488:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 48b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 48e:	8d 45 10             	lea    0x10(%ebp),%eax
{
 491:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 494:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 497:	0f b6 13             	movzbl (%ebx),%edx
 49a:	83 c3 01             	add    $0x1,%ebx
 49d:	84 d2                	test   %dl,%dl
 49f:	75 39                	jne    4da <printf+0x5a>
 4a1:	e9 c2 00 00 00       	jmp    568 <printf+0xe8>
 4a6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4a8:	83 fa 25             	cmp    $0x25,%edx
 4ab:	0f 84 bf 00 00 00    	je     570 <printf+0xf0>
  write(fd, &c, 1);
 4b1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 4b4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4bb:	00 
 4bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c0:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 4c3:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
 4c6:	e8 77 fe ff ff       	call   342 <write>
 4cb:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 4ce:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 4d2:	84 d2                	test   %dl,%dl
 4d4:	0f 84 8e 00 00 00    	je     568 <printf+0xe8>
    if(state == 0){
 4da:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 4dc:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 4df:	74 c7                	je     4a8 <printf+0x28>
      }
    } else if(state == '%'){
 4e1:	83 ff 25             	cmp    $0x25,%edi
 4e4:	75 e5                	jne    4cb <printf+0x4b>
      if(c == 'd'){
 4e6:	83 fa 64             	cmp    $0x64,%edx
 4e9:	0f 84 31 01 00 00    	je     620 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4ef:	25 f7 00 00 00       	and    $0xf7,%eax
 4f4:	83 f8 70             	cmp    $0x70,%eax
 4f7:	0f 84 83 00 00 00    	je     580 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4fd:	83 fa 73             	cmp    $0x73,%edx
 500:	0f 84 a2 00 00 00    	je     5a8 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 506:	83 fa 63             	cmp    $0x63,%edx
 509:	0f 84 35 01 00 00    	je     644 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 50f:	83 fa 25             	cmp    $0x25,%edx
 512:	0f 84 e0 00 00 00    	je     5f8 <printf+0x178>
  write(fd, &c, 1);
 518:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 51b:	83 c3 01             	add    $0x1,%ebx
 51e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 525:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 526:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 528:	89 44 24 04          	mov    %eax,0x4(%esp)
 52c:	89 34 24             	mov    %esi,(%esp)
 52f:	89 55 d0             	mov    %edx,-0x30(%ebp)
 532:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 536:	e8 07 fe ff ff       	call   342 <write>
        putc(fd, c);
 53b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 53e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 541:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 548:	00 
 549:	89 44 24 04          	mov    %eax,0x4(%esp)
 54d:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 550:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 553:	e8 ea fd ff ff       	call   342 <write>
  for(i = 0; fmt[i]; i++){
 558:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 55c:	84 d2                	test   %dl,%dl
 55e:	0f 85 76 ff ff ff    	jne    4da <printf+0x5a>
 564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
 568:	83 c4 3c             	add    $0x3c,%esp
 56b:	5b                   	pop    %ebx
 56c:	5e                   	pop    %esi
 56d:	5f                   	pop    %edi
 56e:	5d                   	pop    %ebp
 56f:	c3                   	ret    
        state = '%';
 570:	bf 25 00 00 00       	mov    $0x25,%edi
 575:	e9 51 ff ff ff       	jmp    4cb <printf+0x4b>
 57a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 580:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 583:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
 588:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 58a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 591:	8b 10                	mov    (%eax),%edx
 593:	89 f0                	mov    %esi,%eax
 595:	e8 46 fe ff ff       	call   3e0 <printint>
        ap++;
 59a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 59e:	e9 28 ff ff ff       	jmp    4cb <printf+0x4b>
 5a3:	90                   	nop
 5a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 5a8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 5ab:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 5af:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 5b1:	b8 94 08 00 00       	mov    $0x894,%eax
 5b6:	85 ff                	test   %edi,%edi
 5b8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 5bb:	0f b6 07             	movzbl (%edi),%eax
 5be:	84 c0                	test   %al,%al
 5c0:	74 2a                	je     5ec <printf+0x16c>
 5c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5c8:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 5cb:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 5ce:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 5d1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5d8:	00 
 5d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5dd:	89 34 24             	mov    %esi,(%esp)
 5e0:	e8 5d fd ff ff       	call   342 <write>
        while(*s != 0){
 5e5:	0f b6 07             	movzbl (%edi),%eax
 5e8:	84 c0                	test   %al,%al
 5ea:	75 dc                	jne    5c8 <printf+0x148>
      state = 0;
 5ec:	31 ff                	xor    %edi,%edi
 5ee:	e9 d8 fe ff ff       	jmp    4cb <printf+0x4b>
 5f3:	90                   	nop
 5f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 5f8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 5fb:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 5fd:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 604:	00 
 605:	89 44 24 04          	mov    %eax,0x4(%esp)
 609:	89 34 24             	mov    %esi,(%esp)
 60c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 610:	e8 2d fd ff ff       	call   342 <write>
 615:	e9 b1 fe ff ff       	jmp    4cb <printf+0x4b>
 61a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 620:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 623:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
 628:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
 62b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 632:	8b 10                	mov    (%eax),%edx
 634:	89 f0                	mov    %esi,%eax
 636:	e8 a5 fd ff ff       	call   3e0 <printint>
        ap++;
 63b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 63f:	e9 87 fe ff ff       	jmp    4cb <printf+0x4b>
        putc(fd, *ap);
 644:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 647:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 649:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 64b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 652:	00 
 653:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 656:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 659:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 65c:	89 44 24 04          	mov    %eax,0x4(%esp)
 660:	e8 dd fc ff ff       	call   342 <write>
        ap++;
 665:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 669:	e9 5d fe ff ff       	jmp    4cb <printf+0x4b>
 66e:	66 90                	xchg   %ax,%ax

00000670 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 670:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 671:	a1 10 0b 00 00       	mov    0xb10,%eax
{
 676:	89 e5                	mov    %esp,%ebp
 678:	57                   	push   %edi
 679:	56                   	push   %esi
 67a:	53                   	push   %ebx
 67b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 67e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 680:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 683:	39 d0                	cmp    %edx,%eax
 685:	72 11                	jb     698 <free+0x28>
 687:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 688:	39 c8                	cmp    %ecx,%eax
 68a:	72 04                	jb     690 <free+0x20>
 68c:	39 ca                	cmp    %ecx,%edx
 68e:	72 10                	jb     6a0 <free+0x30>
 690:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 692:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 694:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 696:	73 f0                	jae    688 <free+0x18>
 698:	39 ca                	cmp    %ecx,%edx
 69a:	72 04                	jb     6a0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 69c:	39 c8                	cmp    %ecx,%eax
 69e:	72 f0                	jb     690 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6a3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 6a6:	39 cf                	cmp    %ecx,%edi
 6a8:	74 1e                	je     6c8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6aa:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6ad:	8b 48 04             	mov    0x4(%eax),%ecx
 6b0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 6b3:	39 f2                	cmp    %esi,%edx
 6b5:	74 28                	je     6df <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6b7:	89 10                	mov    %edx,(%eax)
  freep = p;
 6b9:	a3 10 0b 00 00       	mov    %eax,0xb10
}
 6be:	5b                   	pop    %ebx
 6bf:	5e                   	pop    %esi
 6c0:	5f                   	pop    %edi
 6c1:	5d                   	pop    %ebp
 6c2:	c3                   	ret    
 6c3:	90                   	nop
 6c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 6c8:	03 71 04             	add    0x4(%ecx),%esi
 6cb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6ce:	8b 08                	mov    (%eax),%ecx
 6d0:	8b 09                	mov    (%ecx),%ecx
 6d2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6d5:	8b 48 04             	mov    0x4(%eax),%ecx
 6d8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 6db:	39 f2                	cmp    %esi,%edx
 6dd:	75 d8                	jne    6b7 <free+0x47>
    p->s.size += bp->s.size;
 6df:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 6e2:	a3 10 0b 00 00       	mov    %eax,0xb10
    p->s.size += bp->s.size;
 6e7:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6ea:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6ed:	89 10                	mov    %edx,(%eax)
}
 6ef:	5b                   	pop    %ebx
 6f0:	5e                   	pop    %esi
 6f1:	5f                   	pop    %edi
 6f2:	5d                   	pop    %ebp
 6f3:	c3                   	ret    
 6f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000700 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 709:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 70c:	8b 1d 10 0b 00 00    	mov    0xb10,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 712:	8d 48 07             	lea    0x7(%eax),%ecx
 715:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 718:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 71a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 71d:	0f 84 9b 00 00 00    	je     7be <malloc+0xbe>
 723:	8b 13                	mov    (%ebx),%edx
 725:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 728:	39 fe                	cmp    %edi,%esi
 72a:	76 64                	jbe    790 <malloc+0x90>
 72c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 733:	bb 00 80 00 00       	mov    $0x8000,%ebx
 738:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 73b:	eb 0e                	jmp    74b <malloc+0x4b>
 73d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 740:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 742:	8b 78 04             	mov    0x4(%eax),%edi
 745:	39 fe                	cmp    %edi,%esi
 747:	76 4f                	jbe    798 <malloc+0x98>
 749:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 74b:	3b 15 10 0b 00 00    	cmp    0xb10,%edx
 751:	75 ed                	jne    740 <malloc+0x40>
  if(nu < 4096)
 753:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 756:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 75c:	bf 00 10 00 00       	mov    $0x1000,%edi
 761:	0f 43 fe             	cmovae %esi,%edi
 764:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 767:	89 04 24             	mov    %eax,(%esp)
 76a:	e8 3b fc ff ff       	call   3aa <sbrk>
  if(p == (char*)-1)
 76f:	83 f8 ff             	cmp    $0xffffffff,%eax
 772:	74 18                	je     78c <malloc+0x8c>
  hp->s.size = nu;
 774:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 777:	83 c0 08             	add    $0x8,%eax
 77a:	89 04 24             	mov    %eax,(%esp)
 77d:	e8 ee fe ff ff       	call   670 <free>
  return freep;
 782:	8b 15 10 0b 00 00    	mov    0xb10,%edx
      if((p = morecore(nunits)) == 0)
 788:	85 d2                	test   %edx,%edx
 78a:	75 b4                	jne    740 <malloc+0x40>
        return 0;
 78c:	31 c0                	xor    %eax,%eax
 78e:	eb 20                	jmp    7b0 <malloc+0xb0>
    if(p->s.size >= nunits){
 790:	89 d0                	mov    %edx,%eax
 792:	89 da                	mov    %ebx,%edx
 794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 798:	39 fe                	cmp    %edi,%esi
 79a:	74 1c                	je     7b8 <malloc+0xb8>
        p->s.size -= nunits;
 79c:	29 f7                	sub    %esi,%edi
 79e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 7a1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 7a4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 7a7:	89 15 10 0b 00 00    	mov    %edx,0xb10
      return (void*)(p + 1);
 7ad:	83 c0 08             	add    $0x8,%eax
  }
}
 7b0:	83 c4 1c             	add    $0x1c,%esp
 7b3:	5b                   	pop    %ebx
 7b4:	5e                   	pop    %esi
 7b5:	5f                   	pop    %edi
 7b6:	5d                   	pop    %ebp
 7b7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7b8:	8b 08                	mov    (%eax),%ecx
 7ba:	89 0a                	mov    %ecx,(%edx)
 7bc:	eb e9                	jmp    7a7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 7be:	c7 05 10 0b 00 00 14 	movl   $0xb14,0xb10
 7c5:	0b 00 00 
    base.s.size = 0;
 7c8:	ba 14 0b 00 00       	mov    $0xb14,%edx
    base.s.ptr = freep = prevp = &base;
 7cd:	c7 05 14 0b 00 00 14 	movl   $0xb14,0xb14
 7d4:	0b 00 00 
    base.s.size = 0;
 7d7:	c7 05 18 0b 00 00 00 	movl   $0x0,0xb18
 7de:	00 00 00 
 7e1:	e9 46 ff ff ff       	jmp    72c <malloc+0x2c>
