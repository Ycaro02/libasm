# include "../../libasm.h"


t_list  *ft_lstnew(void *content)
{
        t_list  *new;

        new = malloc(sizeof(t_list) * 1);
        if (new == NULL)
                return (NULL);
        new->next = NULL;
        new->content = content;
        return (new);
}


void display_lst(t_list *lst)
{
	int i = 0;
	while (lst) {
		printf("lst |%p| [%d]= %s\n", lst, i, (char *)lst->content);
		lst = lst->next;
	}
}

static t_list *build_lst(void lst_fun(t_list **, void*))
{
	char *str = ft_strdup("koala");
	t_list *lst = NULL;
	t_list *node = ft_lstnew((void *)str);
	str = ft_strdup("22222");
	t_list *node1 = ft_lstnew((void *)str);
	str = ft_strdup("33333333");
	t_list *node2 = ft_lstnew((void *)str);
	str = ft_strdup("444444444");
	t_list *node3 = ft_lstnew((void *)str);
	str = ft_strdup("ENND");
	t_list *node4 = ft_lstnew((void *)str);


	lst_fun(&lst, node);
	lst_fun(&lst, node1);
	lst_fun(&lst, node2);
	lst_fun(&lst, node3);
	lst_fun(&lst, node4);
	lst_fun(&lst, NULL);
	lst_fun(NULL, NULL);

	return (lst);
}

int test_list_push_front()
{
	int ret = 0;
	t_list *real = build_lst(ft_list_push_front);
	t_list *me = build_lst(list_push_front);
	// display_lst(real);
	// display_lst(me);
	while (me) {
		if (ft_strcmp((char *)me->content, (char *)real->content) != 0) {
			printf(RED"Error got %s expected %s\n"RESET,(char *)me->content, (char *)real->content);
			ret = 1;
			break ;
		}
		me = me->next;
		real = real->next;
	}
	// free(node);
	// free(str);
	return (ret);

}

int main (void)
{
	printf(CYAN"Bonus Tester\n"RESET);
	tester_hub(test_list_push_front, "List push front");
	return (0);
}