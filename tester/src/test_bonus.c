# include "../../libasm.h"

static int is_minus_value(void *a, void *b)
{
	return ((*(char *)a) >= (*(char *)b));
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
	printf(YELLOW"After\n"RESET);
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
		printf("lst %s|%d|%s\t|%p|\t[%d]\t%s%s%s\n", GREEN, (int)((char *)lst->content)[0]\
			, RESET, lst, i, YELLOW, (char *)lst->content, RESET);
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
	str = ft_strdup("dsakljda");
	t_list *node4 = ft_lstnew((void *)str);
	str = ft_strdup("aa");
	t_list *node5 = ft_lstnew((void *)str);


	lst_fun(&lst, node);
	lst_fun(&lst, node1);
	lst_fun(&lst, node2);
	lst_fun(&lst, node3);
	lst_fun(&lst, node4);
	lst_fun(&lst, node5);
	lst_fun(&lst, NULL);
	lst_fun(NULL, NULL);

	return (lst);
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



static int test_lst_sort()
{
	t_list *lst = build_lst(ft_list_push_back);
	display_lst(lst);
	list_sort(&lst, is_minus_value);
	display_lst(lst);
	list_sort(&lst, ft_strcmp);
	display_lst(lst);

	list_clear(&lst, free);
	return (0);
}


int test_list_push_front()
{
	int ret = 0;
	t_list *real = build_lst(ft_list_push_front);
	t_list *me = build_lst(list_push_front);

	t_list *head_real = real;
	t_list *head_me = me;

	while (me) {
		if (ft_strcmp((char *)me->content, (char *)real->content) != 0) {
			printf(RED"Error got %s expected %s\n"RESET,(char *)me->content, (char *)real->content);
			ret = 1;
			break ;
		}
		me = me->next;
		real = real->next;
	}
	list_clear(&head_me, free);
	list_clear(&head_real, free);
	return (ret);
}

int test_list_push_back()
{
	int ret = 0;
	t_list *real = build_lst(ft_list_push_back);
	t_list *me = build_lst(list_push_back);

	t_list *head_real = real;
	t_list *head_me = me;

	while (me) {
		if (ft_strcmp((char *)me->content, (char *)real->content) != 0) {
			printf(RED"Error got %s expected %s\n"RESET,(char *)me->content, (char *)real->content);
			ret = 1;
			break ;
		}
		me = me->next;
		real = real->next;
	}
	list_clear(&head_me, free);
	list_clear(&head_real, free);
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


int main (void)
{
	printf(CYAN"Bonus Tester\n"RESET);
	tester_hub(test_list_push_front, PURPLE"List push front\t"RESET);
	tester_hub(test_list_push_back, PURPLE"List push back\t"RESET);
	tester_hub(test_list_size, PURPLE"List size\t"RESET);
	test_lst_sort();
	return (0);
}