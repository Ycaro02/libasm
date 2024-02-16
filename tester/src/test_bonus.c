# include "../../libasm.h"

static int is_minus_value(void *a, void *b)
{
	return ((*(char *)a) >= (*(char *)b));
}

static int is_max_value(void *a, void *b)
{
	return ((*(char *)a) <= (*(char *)b));
}

void 	list_sort(t_list **lst, int (*cmp)())
{
	t_list  *next;
	t_list  *current;

	if (cmp == NULL || lst == NULL || *lst == NULL)
			return ;
	current = *lst;
	next = current;
	while (next && current && current->next)
	{
			next = current->next;
			if (cmp(next->content, current->content) <= 0) { /* if next value lower than current value reverse for strcmp works */

				void *tmp_content = current->content;	/* just swap content using tmp */
				current->content = next->content;
				next->content = tmp_content;
				
				current = *lst;		/* reset current and next */
				continue ;
			}
			current = next;
	}
}

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
		printf("content: %s[%d]%s\t%s|%p|%s %s[%d]%s\t%s%s%s\n", GREEN, (int)((char *)lst->content)[0]\
			, RESET, CYAN, lst, RESET, RED, i, RESET, YELLOW, (char *)lst->content, RESET);
		++i;
		lst = lst->next;
	}
}

static t_list *build_lst(void lst_fun(t_list **, void*))
{
	char *str = ft_strdup("a");
	t_list *lst = NULL;
	t_list *node = ft_lstnew((void *)str);
	str = ft_strdup("aaa");
	t_list *node1 = ft_lstnew((void *)str);
	str = ft_strdup("yoooo");
	t_list *node2 = ft_lstnew((void *)str);
	str = ft_strdup("-  -");
	t_list *node3 = ft_lstnew((void *)str);
	str = ft_strdup("yoo");
	t_list *node4 = ft_lstnew((void *)str);
	str = ft_strdup("aa");
	t_list *node5 = ft_lstnew((void *)str);
	str = ft_strdup("bb");
	t_list *node6 = ft_lstnew((void *)str);
	str = ft_strdup("!first");
	t_list *node7 = ft_lstnew((void *)str);

	lst_fun(&lst, node);
	lst_fun(&lst, node1);
	lst_fun(&lst, node2);
	lst_fun(&lst, node3);
	lst_fun(&lst, node4);
	lst_fun(&lst, node5);
	lst_fun(&lst, node6);
	lst_fun(&lst, node7);
	lst_fun(&lst, NULL);
	lst_fun(NULL, NULL);

	return (lst);
}



static t_list *get_node_by_str(t_list *lst, char *str)
{
	int i = 0;

	while(lst) {
		if (ft_strcmp(str, (char *)lst->content) == 0)
			return (lst);
		lst = lst->next;
		++i;
	}
	return (NULL);
}

static int test_remove_if()
{
	t_list *lst = build_lst(ft_list_push_front);

	char *str = "aa";
	t_list *to_del = get_node_by_str(lst, str);
	printf(GREEN"Before:, to_Del %s\n"RESET, ((char *) to_del->content));
	display_lst(lst);
	list_remove_if(&lst, to_del->content, is_same_node, free);
	printf(GREEN"After:\n"RESET);
	display_lst(lst);
	
	to_del = get_node_by_str(lst, 0);
	printf(GREEN"Before:, to_Del %s\n"RESET, ((char *) to_del->content));
	display_lst(lst);
	list_remove_if(&lst, to_del->content, is_same_node, free);
	printf(GREEN"After:\n"RESET);
	display_lst(lst);
	return(0);
}

static t_list *build_lst_nb(void lst_fun(t_list **, void*), int max)
{
	t_list *lst = NULL;
	// t_list *node = NULL;
	for (int i =0; i < max; ++i) {
		char *number = ft_itoa(i);
		lst_fun(&lst, ft_lstnew(number));
	}

	return (lst);
}


static int compare_lst_string(t_list *me, t_list *real)
{
	int ret = 0;
	while (me) {
		if (ft_strcmp((char *)me->content, (char *)real->content) != 0) {
			printf(RED"Error got %s expected %s\n"RESET,(char *)me->content, (char *)real->content);
			ret = 1;
			break ;
		}
		me = me->next;
		real = real->next;
	}
	return (ret);
}


int test_list_push_front()
{
	int ret = 0;
	t_list *real = build_lst(ft_list_push_front);
	t_list *me = build_lst(list_push_front);
	if (compare_lst_string(me, real)) {
		return (1);
	}
	list_clear(&me, free);
	list_clear(&real, free);
	return (ret);
}


int test_list_push_back()
{
	int ret = 0;
	t_list *real = build_lst(ft_list_push_back);
	t_list *me = build_lst(list_push_back);
	if (compare_lst_string(me, real)) {
		return (1);
	}
	list_clear(&me, free);
	list_clear(&real, free);
	return (ret);
}

static int check_lst_size(t_list *lst)
{
	int me = ft_list_size(lst);
	int real = list_size(lst);
	if (me != real) {
		printf(RED"Error got %d exptected %d\n"RESET, me , real);
		return (1);
	} 
	return (0);
}

int test_list_size()
{
	int ret = 0;
	t_list *lst = build_lst(ft_list_push_front);
	if (check_lst_size(lst)) {
		ret = 1;
	}
	
	list_clear(&lst, free);
	lst = build_lst_nb(ft_list_push_back, 207);
	if (check_lst_size(lst)) {
		ret = 1;
	}
	list_clear(&lst, free);
	
	lst = build_lst_nb(ft_list_push_front, 2230);

	if (check_lst_size(lst)\
		|| check_lst_size(NULL)) {
		ret = 1;
	}
	list_clear(&lst, free);
	return (ret);
}

static int test_lst_sort()
{
	t_list *first = build_lst(ft_list_push_back);
	t_list *second = build_lst(ft_list_push_back);

	list_sort(&first, is_minus_value);
	ft_list_sort(&second, is_minus_value);
	if (compare_lst_string(first, second)) {
		return (1);
	}

	list_sort(&first, is_max_value);
	ft_list_sort(&second, is_max_value);
	if (compare_lst_string(first, second)) {
		return (1);
	}
	list_sort(&first, ft_strcmp);
	ft_list_sort(&second, ft_strcmp);
	if (compare_lst_string(first, second)) {
		return (1);
	}
	/*
		display_lst(first);
		display_lst(second);
	*/
	list_clear(&first, free);
	list_clear(&second, free);
	return (0);
}


int main (void)
{
	printf(CYAN"Bonus Tester\n"RESET);
	tester_hub(test_list_push_front, PURPLE"List push front\t"RESET);
	tester_hub(test_list_push_back, PURPLE"List push back\t"RESET);
	tester_hub(test_list_size, PURPLE"List size\t"RESET);
	tester_hub(test_lst_sort, PURPLE"List sort\t"RESET);
	tester_hub(test_remove_if, PURPLE"List Remove If\t"RESET);
	return (0);
}