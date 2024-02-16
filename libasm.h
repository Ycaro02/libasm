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
 * void content need to be casted to acces value
*/
typedef struct s_list
{
	void			*content;
	struct s_list	*next;
}	t_list;


/* BONUS */
void 	ft_list_push_back(t_list **begin_list, void *data);	/* real bonus not in subject */
void 	ft_list_push_front(t_list **begin_list, void *data);
int		ft_list_size(t_list *begin_list);
void 	ft_list_sort(t_list **begin_list, int (*cmp)());
/* with function pointer */
void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

// (*cmp)(list_ptr->data, list_other_ptr->data);
int		ft_atoi_base(char *str, char *base);

/* BONUS TEST */
void	list_push_back(t_list **lst, void *data);
void	list_push_front(t_list **lst, void *data);
int		list_size(t_list *begin_list);
void 	list_sort(t_list **begin_list, int (*cmp)());
void    list_remove_if(t_list **list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

int		my_atoi_base(char *str, char *base);
/* utils */
int 	is_same_node(void *node1, void *node2);
void    list_clear(t_list **lst, void (*del)(void*));
char    *ft_itoa(int n);
void    ft_sort_int_tab(long int *tab, int size);

#endif /* FT_LIBASM_H */

// (write.o): warning: relocation against `__errno_location