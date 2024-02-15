/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi_base.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nfour <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/03 17:51:52 by nfour             #+#    #+#             */
/*   Updated: 2022/09/04 12:24:58 by nfour            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
#include "../../libasm.h"

int	ft_get_int(char c, char *base)
{
	int	i;

	i = 0;
	while (base[i] != '\0')
	{
		if (base[i] == c)
			return (i);
		i++;
	}
	return (0);
}

int	char_is_in_base(char c, char *base)
{
	int	i;

	i = 0;
	while (base[i] != '\0')
	{
		if (c == base[i])
			return (1);
		i++;
	}
	return (0);
}

int	ft_check_base(char *str)
{
	int	i;
	int	j;

	i = 0;
	j = 0;
	if (ft_strlen(str) <= 1)
		return (1);
	while (str[i] != '\0')
	{
		if (str[i] == ' ' || str[i] == '+' || str [i] == '-'
			|| (str[i] >= '\t' && str[i] <= '\n'))
			return (1);
		j = i + 1;
		while (str[j] != '\0')
		{
			if (str[i] != str[j])
				j++;
			else if (str[i] == str [j])
				return (1);
		}
		i++;
	}
	return (ft_strlen(str));
}

int	my_atoi_base(char *str, char *base)
{
	int	i;
	int	sign;
	int	tmp;

	if (ft_check_base(base) == 1)
		return (0);
	i = 0;
	sign = 1;
	tmp = 0;
	while ((str[i] >= '\t' && str[i] <= '\r') || str[i] == 32)
		i++;
	while (str[i] == '+' || str[i] == '-')
	{
		if (str[i] == '-')
			sign *= -1;
		i++;
	}
	while (char_is_in_base(str[i], base) == 1)
	{
		tmp *= ft_check_base(base);
		tmp += ft_get_int(str[i], base);
		i++;
	}
	return (sign * tmp);
}
