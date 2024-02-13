# include "../../libasm.h"
# include "../basic_define.h"
# include <stdio.h>
# include <stdlib.h>

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


static int test_strcpy()
{
    char *str = "alo";
    int max = 10;
    char *tmp = malloc(sizeof(char) * max);
    for (int i = 0; i < max; ++i) {
        tmp[i] = 'Y';
    }
    tmp[max - 1] = '\0';
    printf("tmp before = %s\n", tmp);
    tmp = ft_strcpy(tmp, str);
    printf("ret strcpy = %s\n", tmp);
    
    char *big = "1234567890123456789";
    tmp = ft_strcpy(tmp, big);
    printf("ret strcpy = %s\n", tmp);
    free(tmp);
    return (0);

}

int main(void)
{
    if (test_strlen() == 0){
        printf(GREEN"Strlen test OK\n"RESET);
    } else {
        printf(RED"Strlen test KO\n"RESET);
    }
    if (test_strcpy() == 0){
        printf(GREEN"Strcpy test OK\n"RESET);
    } else {
        printf(RED"Strcpy test KO\n"RESET);
    }
}