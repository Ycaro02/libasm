
#include "../../libasm.h"

/* create node */
t_list  *create_lst_node(void *data)
{
	t_list  *node;

	node = malloc(sizeof(t_list) * 1);
	if (!node)
			return (NULL);
	node->next = NULL;
	node->data = data;
	return (node);
}

void	list_push_front(t_list **lst, void *data)
{
	if (lst == NULL || data == NULL)
		return ;
	t_list *new_node = ft_create_list_node(data);
	new_node->next = *lst;
	*lst = new_node;
}

void	list_push_back(t_list **lst, void *data)
{
	t_list	*current = NULL;

	if (data == NULL)
		return ;
	
	t_list 	*new_node = ft_create_list_node(data);
	
	if (*lst == NULL) {
		*lst = new_node;
		return ;
	}
	current = *lst;
	while (current->next != NULL)
		current = current->next;
	current->next = new_node;
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


int is_same_node(void *node1, void *node2)
{
	return (node1 == node2);
}

/*
        lst_remove_if : iter on list and delete targeted node
                        args:
                                list: addr of the head of linked list to iter on
                                del: function ptr on the free_node function
                                        args:
                                                void *: lst data
                                condition: function ptr return true for free node
                                        args:
                                                void *: node to check
*/
void    list_remove_if(t_list **list, void *data_ref, int (*cmp)(), void (*free_fct)(void*))
{
	t_list  *tmp = NULL;
	t_list  *current = NULL;

	if (!list || !cmp || !free_fct || !data_ref)
		return;
	current = *list;
	// printf(YELLOW"current |%s| data |%s|\n"RESET, (char *)current->data, (char *)data_ref);
	if (current && cmp(current->data, data_ref) == TRUE) {
		*list = (*list)->next;
		free_fct(current->data);
		free(current);
		current = *list;
	}
	while (current) {
		if (current->next && cmp(current->next->data, data_ref) == TRUE) {
			tmp = current->next;
			current->next = current->next->next;
			free_fct(tmp->data);
			free(tmp);
		}
		else
			current = current->next;
	}
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
                del(current->data);
                free(current);
                current = tmp;
        }
        *lst = NULL;
}

