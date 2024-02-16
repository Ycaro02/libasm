/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   my_atoi_base.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nfour <<marvin@42.fr>>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/03 17:51:52 by nfour             #+#    #+#             */
/*   Updated: 2024/02/16 17:41:59 by nfour            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

# include "../../libasm.h"

int	char_to_numb(char c, char *base)
{
	int	i = 0;

	while (base[i]) {
		if (base[i] == c)
			return (i);
		i++;
	}
	return (0);
}

int	char_in_base(char c, char *base)
{
	int	i = 0;

	while (base[i]) {
		if (c == base[i])
			return (1);
		i++;
	}
	return (0);
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
		if (str[i] == ' ' || str[i] == '+' || str [i] == '-'
			|| (str[i] >= '\t' && str[i] <= '\n'))
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
	while ((str[i] >= '\t' && str[i] <= '\r') || str[i] == 32)
		i++;
	while (str[i] == '+' || str[i] == '-') {
		if (str[i] == '-')
			sign *= -1;
		i++;
	}
	while (char_in_base(str[i], base) == 1) {
		tmp *= base_len;
		tmp += char_to_numb(str[i], base);
		i++;
	}
	return (sign * tmp);
}
