# include "../../libasm.h"
# include "../basic_define.h"
# include <stdio.h>
# include <stdlib.h>
#include <string.h>

size_t basic_strlen(char *str)
{
    size_t i = 0;
    while (str[i]) {
        i++;
    }
    return (i);
}

static int test_strlen()
{
    char *str = "koala";
    printf("str:%s\nAssembly len |%lu|\n", str, ft_strlen(str));
    printf("Basic strlen |%lu|\n", basic_strlen(str));
    str = NULL;
    printf("str:NULL\nAssembly len |%lu|\n", ft_strlen(str));
    str = "heylolsdasdadsa";
    printf("str:%s\nAssembly len |%lu|\n", str, ft_strlen(str));
    str = "very longnnfjf lonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnng";
    printf("str:%s\nAssembly len |%lu|\n", str, ft_strlen(str));
    str = "";
    printf("str:%s\nAssembly len |%lu|\n", str, ft_strlen(str));
    return (0);

}


static int strcpy_null_test()
{
    int max = 10, ret = 0;
    char *tmp = malloc(sizeof(char) * max);
    for (int i = 0; i < max; ++i) {
        tmp[i] = 'Y';
    }
    tmp[max - 1] = '\0';
    char *save = strdup(tmp);
    
    printf("Test ft_strcpy(NULL, NULL)\n");
    ft_strcpy(NULL, NULL);
    if (strcmp(save, tmp) != 0) {
        ret = 1;
    } 
    else 
    {
        printf("Test ft_strcpy(tmp, NULL)\n");
        tmp = ft_strcpy(tmp, NULL);
        printf("tmp = %s\n", tmp);
        if (strcmp(save, tmp) != 0) {
            ret = 1;
        } 
        else {
            printf("Test ft_strcpy(NULL, tmp)\n");
            ft_strcpy(NULL, tmp);
            if (strcmp(save, tmp) != 0) {
                ret = 1;
            }
        }
    }
    free(save);
    free(tmp);
    return (ret);
    
}

static int test_strcpy()
{
    char *str = "alo";
    int max = 10, ret = 0;
    char *tmp = malloc(sizeof(char) * max);
    for (int i = 0; i < max; ++i) {
        tmp[i] = 'Y';
    }
    tmp[max - 1] = '\0';
    printf("tmp before = %s\n", tmp);
    tmp = ft_strcpy(tmp, str);
    printf("ret strcpy = %s\n", tmp);
    
    char *save = strdup(tmp);
    
    char *big = "1234567";
    tmp = ft_strcpy(tmp, big);
    if (strcmp(save, tmp) != 0) {
        ret = 1;
    }
    free(tmp);
    free(save);
    ret = strcpy_null_test();
    return (ret);

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