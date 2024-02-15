# include "../../libasm.h"

int main(void)
{
    tester_hub(test_strlen, YELLOW"ft_strlen"RESET);
    tester_hub(test_strcpy, YELLOW"ft_strcpy"RESET);
    tester_hub(test_strcmp, YELLOW"ft_strcmp"RESET);
    tester_hub(test_strdup, YELLOW"ft_strdup"RESET);
    // printf("test strcpy :\n");
    // char *dest = malloc(sizeof(char)*10);
    // char *src = "Coucou";
    // dest = ft_strcpy(dest, src);
    // printf("src %s dest: %s\n", src, dest);
    return (0);
}