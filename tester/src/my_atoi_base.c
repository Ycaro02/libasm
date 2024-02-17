/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   my_atoi_base.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nfour <<marvin@42.fr>>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/03 17:51:52 by nfour             #+#    #+#             */
/*   Updated: 2024/02/16 18:05:19 by nfour            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

# include "../../libasm.h"

int	char_to_numb(char c, char *base)
{
	int	i = 0;

	while (*base) {
		if (*base == c)
			return (i);
		++i;
		++base;
	}
	return (i);
}

int	char_in_base(char c, char *base)
{
	while (*base && *base != c) { /* base checked in is_valid_base/atoi start, can't be null here */
		++base;
	}
	return (*base != '\0');
}

int is_space(char c)
{
	return ((c >= '\t' && c <= '\r') || c == 32);
}

int	is_valid_base(char *str)
{
	int	i = 0;
	int	j = 0;
	int len = ft_strlen(str); /* strlen protect against NULL return 0 */

	if (len <= 1) {
		return (-1);
	}
	while (str[i])
	{
		if (ft_is_space(str[i]) || str[i] == '+' || str[i] == '-')
			return (-1);
		j = i + 1;
		while (str[j] != '\0')
		{
			if (str[i] != str[j])
				j++;
			else if (str[i] == str [j])
				return (-1);
		}
		i++;
	}
	return (len);
}

int	my_atoi_base(char *str, char *base)
{
	int	i = 0;
	int	tmp = 0;
	int	sign = 1;
	int base_len = is_valid_base(base);

	if (!str || base_len == -1)
		return (0);
	while (ft_is_space(str[i]))
		i++;
	while (str[i] == '+' || str[i] == '-') {
		if (str[i] == '-')
			sign *= -1;
		i++;
	}
	while (ft_char_in_base(str[i], base) == 1) {
		tmp *= base_len;
		tmp += ft_char_to_numb(str[i], base);
		i++;
	}
	return (sign * tmp);
}
