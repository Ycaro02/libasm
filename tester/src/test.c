# include "../../libasm.h"

int main(void)
{
    tester_hub(test_strlen, YELLOW"ft_strlen"RESET, 0);
    tester_hub(test_strcpy, YELLOW"ft_strcpy"RESET, 0);
    tester_hub(test_strcmp, YELLOW"ft_strcmp"RESET, 0);
    tester_hub(test_strdup, YELLOW"ft_strdup"RESET, 0);
    return (0);
}