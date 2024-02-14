# include "../../libasm.h"
# include "../basic_define.h"
# include <stdio.h>
# include <stdlib.h>
#include <string.h>


// static int test_gccstrlen()
// {
//     char *str = "koala";
//     printf("str:%s\nAssembly len |%lu|\n", str, gcc_strlen(str));
//     printf("Basic strlen |%lu|\n", basic_strlen(str));
//     str = NULL;
//     printf("str:NULL\nAssembly len |%lu|\n", gcc_strlen(str));
//     str = "heylolsdasdadsa";
//     printf("str:%s\nAssembly len |%lu|\n", str, gcc_strlen(str));
//     str = "very longnnfjf lonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnng";
//     printf("str:%s\nAssembly len |%lu|\n", str, gcc_strlen(str));
//     str = "";
//     printf("str:%s\nAssembly len |%lu|\n", str, gcc_strlen(str));
//     return (0);
// }

int new_strcmp(char *s1, char *s2)
{
	int i = 0, j = 0;

	while ((s1[i] && s2[j]) && s1[i] == s2[j]) {
		++i;
		++j;
	}
	return (s1[i] - s2[j]);
}

size_t basic_strlen(char *str)
{
    size_t i = 0;
    if (!str)
        return (0);
    while (str[i]) {
        i++;
    }
    return (i);
}

static int check_strlen(char *str)
{
    return (ft_strlen(str) == basic_strlen(str));
}

static int test_strlen()
{
    if (!check_strlen("koala")\
        || !check_strlen(NULL)\
        || !check_strlen("")\
        || !check_strlen(" ")\
        || !check_strlen("very longnnfjf lonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnng")\
        || !check_strlen("y")\
        || !check_strlen("yooo\nsdasda")\
        || !check_strlen("yasda\0sdadsa")) {
            return (1);
    }
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
    ft_strcpy(NULL, NULL);
    if (ft_strcmp(save, tmp) != 0) {
        ret = 1;
    } 
    else 
    {
        tmp = ft_strcpy(tmp, NULL);
        if (ft_strcmp(save, tmp) != 0) {
            ret = 1;
        } 
        else {
            ft_strcpy(NULL, tmp);
            if (ft_strcmp(save, tmp) != 0) {
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
    if (ft_strcmp(str, tmp) != 0) {
        printf(RED"Error ret strcpy = %s expected %s\n"RESET, tmp, str);
        ret = 1;
    }
    if (ret != 1) {
        char *save = strdup(tmp);
        
        char *big = "1234567";
        tmp = ft_strcpy(tmp, big);
        if (ft_strcmp(save, tmp) != 0) {
            printf(RED"Error ret strcpy = %s expected %s\n"RESET, tmp, save);
            ret = 1;
        }
        free(save);
    }
    free(tmp);
    ret = strcpy_null_test();
    return (ret);

}

static int test_strcmp()
{    
    if (ft_strcmp("koala", "kopoa") != 'a' - 'p') {
        printf("Error strcmp koala kopoa\n");
        return (1);
    }
    if (ft_strcmp("koala", "koala") != 0) {
        printf("Error koala koala\n");
        return (1);
    }
    if (ft_strcmp(NULL, NULL) != 0) {
        printf("Error NULL NULL %d expected %d\n", ft_strcmp(NULL, NULL), 0);
        return (1);
    }
    if (ft_strcmp("koala", NULL) != 'k') {
        printf("Error koala NULL %d expected %d\n", ft_strcmp("koala", NULL), 'k');
        return (1);
    }
    if (ft_strcmp(NULL, "koala") != -'k') {
        printf("Error NULL koala %d expected %d\n", ft_strcmp(NULL, "koala"), -'k');
        return (1);
    }
    return (0);
}
    // char *test1 = "bonjours";
    // char *test2 = "bonjours";
    // printf(PURPLE"cmp --> |%s| : |%s| = %d\n"RESET, test1, test2, ft_strcmp(test1, test2));
    // test2 = "bonjour";
    // printf("%scmp --> |%s| : |%s| = %d%s\n",PURPLE, test1, test2, ft_strcmp(test1, test2), RESET);

void tester_hub(int test_fun(void), char *str){
    if (test_fun() == 0) {
        printf(GREEN"%s test OK\n"RESET, str);

    } else {
        printf(RED"%s test KO\n"RESET, str);
    }
}

int main(void)
{
    tester_hub(test_strlen, "strlen");
    tester_hub(test_strcpy, "strcpy");
    tester_hub(test_strcmp, "strcmp");
}