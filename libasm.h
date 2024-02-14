#ifndef LIBASM_H
# define LIBASM_H

# include <stddef.h>
# include <sys/types.h>
# include <errno.h>

size_t  ft_strlen(char const *str);

size_t  gcc_strlen(char const *str);

char    *ft_strcpy(char *dest, const char *src);

int     ft_strcmp( const char * first, const char * second );

ssize_t ft_write(int fd, const void *buf, size_t count);

#endif /* LIBASM_H */

// (write.o): warning: relocation against `__errno_location