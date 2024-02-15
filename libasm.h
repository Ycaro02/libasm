#ifndef FT_LIBASM_H
# define FT_LIBASM_H

# include "tester/basic_define.h"
# include <stddef.h>
# include <sys/types.h>
# include <errno.h>
# include <unistd.h>
# include <fcntl.h>


# include <stdio.h>
# include <stdlib.h>
# include <string.h>


size_t  ft_strlen(char const *str);

size_t  gcc_strlen(char const *str);

char    *ft_strcpy(char *dest, const char *src);

int     ft_strcmp( const char * first, const char * second );

ssize_t ft_write(int fd, const void *buf, size_t count);

ssize_t ft_read(int fd, const void *buf, size_t nbytes);

char    *ft_strdup(const char *s);

void        tester_hub(int test_fun(void), char *str);
int  test_strcmp();
int  test_strcpy();
int  test_strlen();

#endif /* FT_LIBASM_H */

// (write.o): warning: relocation against `__errno_location