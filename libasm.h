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

/* mandatory function */
size_t      ft_strlen(char const *str);
char        *ft_strcpy(char *dest, const char *src);
int         ft_strcmp( const char * first, const char * second );
ssize_t     ft_write(int fd, const void *buf, size_t count);
ssize_t     ft_read(int fd, const void *buf, size_t nbytes);
char        *ft_strdup(const char *s);

/* tester function */
void        tester_hub(int test_fun(void), char *str);
int         test_strcmp();
int         test_strcpy();
int         test_strlen();
int         test_strdup();

/**
 * Simple linked list
*/
typedef struct s_list
{
	struct s_list	*next;
	void			*data;
}	t_list;


// typedef struct s_list
// {
// 	void			*data;
// 	struct s_list	*next;
// }	t_list;


/* BONUS */
/* list utils  create node */
t_list *ft_create_list_node(void *data);
void 	ft_list_push_back(t_list **begin_list, void *data);	/* real bonus not in subject */
void 	ft_list_push_front(t_list **begin_list, void *data);
int		ft_list_size(t_list *begin_list);
void 	ft_list_sort(t_list **begin_list, int (*cmp)());
void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
int		ft_atoi_base(char *str, char *base);
/* atoi base utils, src/bonus/utils */
/* asm version char to numb */
int		ft_char_to_numb(char c, char *base);
/* asm version char in base */
int		ft_char_in_base(char c, char *base);
/* asm version is space */
int		ft_is_space(char c);
/* asm version is valid base */
int		ft_is_valid_base(char *str);

/* TESTER */
/* BONUS TEST */
void	list_push_back(t_list **lst, void *data);
void	list_push_front(t_list **lst, void *data);
int		list_size(t_list *begin_list);
void 	list_sort(t_list **begin_list, int (*cmp)());
void    list_remove_if(t_list **list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

int		my_atoi_base(char *str, char *base);
/* tester utils */
int 	is_same_node(void *node1, void *node2);
void    list_clear(t_list **lst, void (*del)(void*));
char    *ft_itoa(int n);
void    ft_sort_int_tab(long int *tab, int size);

t_list  *create_lst_node(void *data);

#endif /* FT_LIBASM_H */

// (write.o): warning: relocation against `__errno_location