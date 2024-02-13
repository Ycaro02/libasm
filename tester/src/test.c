# include "../../libasm.h"
# include "../basic_define.h"
# include <stdio.h>

int basic_strlen(char *str)
{
    int i = 0;
    while (str[i]) {
        i++;
    }
    return (i);
}

static int test_strlen()
{
    char *str = "koala";
    printf("str:%s\nAssembly len |%d|\n", str, ft_strlen(str));
    printf("Basic strlen |%d|\n", basic_strlen(str));
    str = NULL;
    printf("str:NULL\nAssembly len |%d|\n", ft_strlen(str));
    str = "heylolsdasdadsa";
    printf("str:%s\nAssembly len |%d|\n", str, ft_strlen(str));
    str = "very longnnfjf lonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnng";
    printf("str:%s\nAssembly len |%d|\n", str, ft_strlen(str));
    str = "";
    printf("str:%s\nAssembly len |%d|\n", str, ft_strlen(str));
    return (0);

}


int main(void)
{
    if (test_strlen() == 0){
        printf(GREEN"Strlen test OK\n"RESET);
    } else {
        printf(RED"Strlen test KO\n"RESET);
    }
    char *str = "alo";
    char *str2 = "ccccc";
    ft_strcpy(str, str2);
    return (0);
}