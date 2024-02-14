# include "../../libasm.h"
# include "../basic_define.h"
# include <stdio.h>
# include <stdlib.h>
#include <string.h>


int new_strcmp(char *s1, char *s2)
{
	int i = 0, j = 0;

	while ((s1[i] && s2[j]) && s1[i] == s2[j]) {
		++i;
		++j;
	}
	return (s1[i] - s2[j]);
}

int cmpbis(char *s1, char *s2)
{
	int i = 0, j = 0;


	while (s1[i] && s2[j]) {
        if (s1[i] != s2[j]) {
            break;
        }
		++i;
		++j;
	}
	return (s1[i] - s2[j]);
}


/*
Dump of assembler code for function basic_strlen:

*/

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

static int test_gccstrlen()
{
    char *str = "koala";
    printf("str:%s\nAssembly len |%lu|\n", str, gcc_strlen(str));
    printf("Basic strlen |%lu|\n", basic_strlen(str));
    str = NULL;
    printf("str:NULL\nAssembly len |%lu|\n", gcc_strlen(str));
    str = "heylolsdasdadsa";
    printf("str:%s\nAssembly len |%lu|\n", str, gcc_strlen(str));
    str = "very longnnfjf lonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnng";
    printf("str:%s\nAssembly len |%lu|\n", str, gcc_strlen(str));
    str = "";
    printf("str:%s\nAssembly len |%lu|\n", str, gcc_strlen(str));
    return (0);

}




static int ahah(){
    return (0x42);
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
    ahah();
    printf("Test ft_strcpy(NULL, NULL)\n");
    ft_strcpy(NULL, NULL);
    if (cmpbis(save, tmp) != 0) {
        ret = 1;
    } 
    else 
    {
        printf("Test ft_strcpy(tmp, NULL)\n");
        tmp = ft_strcpy(tmp, NULL);
        printf("tmp = %s\n", tmp);
        if (cmpbis(save, tmp) != 0) {
            ret = 1;
        } 
        else {
            printf("Test ft_strcpy(NULL, tmp)\n");
            ft_strcpy(NULL, tmp);
            if (cmpbis(save, tmp) != 0) {
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
    tmp = ft_strcpy(tmp, str);
    if (cmpbis(str, tmp) != 0) {
        printf(RED"Error ret strcpy = %s expected %s\n"RESET, tmp, str);
        ret = 1;
    }
    if (ret != 1) {
        char *save = strdup(tmp);
        
        char *big = "1234567";
        tmp = ft_strcpy(tmp, big);
        if (cmpbis(save, tmp) != 0) {
            printf(RED"Error ret strcpy = %s expected %s\n"RESET, tmp, save);
            ret = 1;
        }
        free(save);
    }
    free(tmp);
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
    ft_strcmp("koala", "kopoa");
    // test_gccstrlen();
}