
#include "../../libasm.h"

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

void	list_push_front(t_list **lst, void *data)
{
	if (lst == NULL || data == NULL)
		return ;
	((t_list *)data)->next = *lst;
	*lst = data;
}

void	list_push_back(t_list **lst, void *data)
{
	t_list	*current;

	if (data == NULL)
		return ;
	if (*lst == NULL)
	{
		*lst = data;
		return ;
	}
	current = *lst;
	while (current->next != NULL)
		current = current->next;
	current->next = data;
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

