# include "../../libasm.h"

int main(void)
{
    tester_hub(test_strlen, YELLOW"ft_strlen"RESET);
    tester_hub(test_strcpy, YELLOW"ft_strcpy"RESET);
    tester_hub(test_strcmp, YELLOW"ft_strcmp"RESET);
}