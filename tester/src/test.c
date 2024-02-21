# include "../libasm.h"

int main(void)
{
    tester_hub(test_strlen, YELLOW"ft_strlen\t"RESET);
    tester_hub(test_strcpy, YELLOW"ft_strcpy\t"RESET);
    tester_hub(test_strcmp, YELLOW"ft_strcmp\t"RESET);
    tester_hub(test_strdup, YELLOW"ft_strdup\t"RESET);
    return (0);
}