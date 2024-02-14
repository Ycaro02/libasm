# include "../../libasm.h"
# include "../basic_define.h"
# include <stdio.h>
# include <errno.h>
# include <stdlib.h>
#include <string.h>

int         basic_strcmp(char *s1, char *s2)
{
	int i = 0, j = 0;

	while ((s1[i] && s2[j]) && s1[i] == s2[j]) {
		++i;
		++j;
	}
	return (s1[i] - s2[j]);
}

size_t      basic_strlen(char *str)
{
    size_t i = 0;
    if (!str)
        return (0);
    while (str[i]) {
        i++;
    }
    return (i);
}

static int  check_strlen(char *str)
{
    return (ft_strlen(str) == basic_strlen(str));
}

static int  test_strlen()
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

static int  check_strcpy(char *src, char *str, char *expected)
{
    src = ft_strcpy(src, str);
    if (ft_strcmp(expected, src) != 0) {
        printf(RED"Error ret strcpy = %s expected %s\n"RESET, src, expected);
        return (1);
    }
    return (0);
}

static int  strcpy_null_test()
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

static int  test_strcpy()
{
    char *str = "Classic test";
    int max = 25, ret = 0;
    char *tmp = malloc(sizeof(char) * max);
    for (int i = 0; i < max; ++i) {
        tmp[i] = 'Y';
    }
    tmp[max - 1] = '\0';

    if (check_strcpy(tmp, str, str)) {
        ret = 1;
    } 
    if (ret == 0) {
        char *save = strdup(tmp);
        char *big = "Biggggeeeeeeeeeeeeeeeeeeeesseeeeeeeesst";
        if (check_strcpy(tmp, big, save)) {
            ret = 1;
        }
        free(save);
    }
    if (ret == 0) {
        free(tmp);
        max = 200;
        tmp = malloc(sizeof(char)*max);
        for (int i = 0; i < max; ++i) {
            tmp[i] = 'Y';
        }
        tmp[max - 1] = '\0';
        str = "BIG BIG BIG BIG BIG BIG BIG BIG TESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTEST OK OK OK OK OK\nBIG TESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTEST OK OK OK OK OK";
        if (check_strcpy(tmp, str, str)) {
            ret = 1;
        } 
    }
    free(tmp);
    if (ret == 0) {
        ret = strcpy_null_test();
    }
    return (ret);

}

static int  test_strcmp()
{    
    if (ft_strcmp("koala", "kopoa") != 'a' - 'p') {
        printf(YELLOW"Error strcmp koala kopoa\n"RESET);
        return (1);
    }
    if (ft_strcmp("koala", "koala") != 0) {
        printf(YELLOW"Error koala koala\n"RESET);
        return (1);
    }
    if (ft_strcmp(NULL, NULL) != 0) {
        printf(YELLOW"Error NULL NULL %d expected %d\n"RESET, ft_strcmp(NULL, NULL), 0);
        return (1);
    }
    if (ft_strcmp("koala", NULL) != 'k') {
        printf(YELLOW"Error koala NULL %d expected %d\n"RESET, ft_strcmp("koala", NULL), 'k');
        return (1);
    }
    if (ft_strcmp(NULL, "koala") != -'k') {
        printf(YELLOW"Error NULL koala %d expected %d\n"RESET, ft_strcmp(NULL, "koala"), -'k');
        return (1);
    }
    if (ft_strcmp("koalaaaaaaaaa", "koala") != 'a') {
        printf(YELLOW"Error koalaaaaaaaaa %d koala expected %d\n"RESET, ft_strcmp("koalaaaaaaaaa", "koala"), 'a');
        return (1);
    }
    if (ft_strcmp("koala", "koalaaaaaaaaa") != -'a') {
        printf(YELLOW"Error koala %d koalaaaaaaaaa expected %d\n"RESET, ft_strcmp("koala", "koalaaaaaaaaa"), -'a');
        return (1);
    }
    return (0);
}

void        tester_hub(int test_fun(void), char *str)
{
    int     error = 0;
    char    *color, *msg;

    error = test_fun();
    color = error == 0 ? GREEN : RED;
    msg = error == 0 ? "OK" : "KO";
    printf("%s test %s%s\n"RESET, str, color, msg);
}

int main(void)
{
    tester_hub(test_strlen, YELLOW"ft_strlen"RESET);
    tester_hub(test_strcpy, YELLOW"ft_strcpy"RESET);
    tester_hub(test_strcmp, YELLOW"ft_strcmp"RESET);
    ft_write(1, "KOALA", ft_strlen("KOALA"));
}