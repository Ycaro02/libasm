
#include "../../libasm.h"

void	list_push_front(t_list **lst, void *data)
{
	if (lst == NULL || data == NULL)
		return ;
	((t_list *)data)->next = *lst;
	*lst = data;
}

void	list_push_back(t_list **lst, void *data)
{
	t_list	*current = NULL;

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
	int		count = 0;

	while (lst != NULL)
	{
		lst = lst->next;
		count++;
	}
	return (count);
}

void    list_clear(t_list **lst, void (*del)(void*))
{
        t_list  *tmp;
        t_list  *current;

        if (del == NULL || lst == NULL || *lst == NULL)
                return ;
        current = *lst;
        tmp = current;
        while (tmp != NULL)
        {
                tmp = current->next;
                del(current->content);
                free(current);
                current = tmp;
        }
        *lst = NULL;
}


