/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   my_atoi_base.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nfour <<marvin@42.fr>>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/03 17:51:52 by nfour             #+#    #+#             */
/*   Updated: 2024/02/17 10:53:59 by nfour            ###   ########.fr       */
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
	while (str[i]) {
		if (ft_is_space(str[i]) || str[i] == '+' || str[i] == '-')
			return (-1);
		j = i + 1;
		while (str[j]) {
			if (str[i] == str[j])
				return (-1);
			++j;
		}
		++i;
	}
	return (len);
}


// ; register	| type	| name	| def			| addr	| byte
// ; RDI		| char* | str	| nb to convert	| 0x18	| 8
// ; RSI		| char*	| base	| nb base from	| 0x20	| 8
// ; Local var	| int	| i		| str counter	| 0x10	| 4
// ; Local var	| int	| tmp	| tampon swap	| 0xc	| 4
// ; Local var | int	| sign	| sign value	| 0x8	| 4
// ; Local var | int	| len	| base len		| 0x4	| 4

// + = 43: - = 45
// ((c == 43) * 1) + ((c == 45) * -1)
int	my_atoi_base(char *str, char *base)
{
	int	i = 0;
	int	tmp = 0;
	int	sign = 1;
	int base_len = is_valid_base(base);

	if (!str || base_len == -1)
		return (0);
	while (is_space(str[i]))
		i++;
	while (str[i] == '+' || str[i] == '-') {
		sign *= ((str[i] == '+') + (str[i] == '-') * -1);
		// need check 2 version in asm
		// if (str[i] == '-') 
		// 	sign *= -1;
		++i;
	}
	while (char_in_base(str[i], base) == 1) {
		tmp *= base_len;
		tmp += char_to_numb(str[i], base);
		++i;
	}
	return (sign * tmp);
}
