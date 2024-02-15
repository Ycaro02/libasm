
#include "../libasm.h"

// void 	ft_list_sort(t_list **begin_list, int (*cmp)())
// {
//     if (!lst)
//         return ;
//     t_list *head = lst;
//     t_list *min = NULL;
//     while (lst)  {
//         if (!min)
//             min = lst;
//         if (cmp())
//             min = lst;
//         lst = lst->next;
//     }
//     t_file *tmp = head->content;
//     head->content = min->content;
//     min->content = tmp;
//     sort_by_name(head->next, flag_nb);
// }

void	list_push_front(t_list **lst, t_list *new)
{
	if (lst == NULL || new == NULL)
		return ;
	new->next = *lst;
	*lst = new;
}

void	list_push_back(t_list **lst, t_list *new)
{
	t_list	*current;

	if (new == NULL)
		return ;
	if (*lst == NULL)
	{
		*lst = new;
		return ;
	}
	current = *lst;
	while (current->next != NULL)
		current = current->next;
	current->next = new;
}

int	list_size(t_list *lst)
{
	int		count;

	count = 0;
	while (lst != NULL)
	{
		lst = lst->next;
		count++;
	}
	return (count);
}

