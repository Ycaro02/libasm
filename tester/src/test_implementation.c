# include "../libasm.h"

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

int  test_strlen()
{
	if (!check_strlen("koala")\
		|| !check_strlen(NULL)\
		|| !check_strlen("")\
		|| !check_strlen(" ")\
		|| !check_strlen("very longnnfjf lonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnng")\
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
		printf(RED"Error ret strcpy tested NULL NULL\n"RESET);
		printf(YELLOW"Error ret strcpy got %s expected %s\n"RESET, tmp, save);
		ret = 1;
	} 
	else 
	{
		tmp = ft_strcpy(tmp, NULL);
		if (ft_strcmp(save, tmp) != 0) {
			printf(RED"Error ret strcpy tested %s NULL\n"RESET, save);
			printf(YELLOW"Error ret strcpy got %s expected %s\n"RESET, tmp, save);
			ret = 1;
		} 
		else {
			ft_strcpy(NULL, tmp);
			if (ft_strcmp(save, tmp) != 0) {
				printf(RED"Error ret strcpy tested NULL %s\n"RESET, save);
				printf(YELLOW"Error ret strcpy got %s expected %s\n"RESET, tmp, save);
				ret = 1;
			}
		}
	}
	free(save);
	free(tmp);
	return (ret);
	
}

int  test_strcpy()
{
	char *str = "Classic test";
	int max = 25, ret = 0;
	char *tmp = malloc(sizeof(char) * max);

	if (check_strcpy(tmp, str, str)) {
		ret = 1;
	} 
	if (ret == 0) {
		char *save = strdup(tmp);
		char *test = "We can write here";
		if (check_strcpy(tmp, test, test)) {
			ret = 1;
		}
		free(save);
	}
	if (ret == 0) {
		free(tmp);
		max = 1200;
		tmp = malloc(sizeof(char)*max);
		str = "BIG BIG BIG BIG lonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnglonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnng";
		if (check_strcpy(tmp, str, str)) {
			ret = 1;
		} 
	}
	free(tmp);
	if (ret == 0) {
		ret = strcpy_null_test();
	}
	if (ret == 0){
		tmp = calloc(sizeof(char), 10);
		tmp[0] = 'a';
		if (check_strcpy(tmp, "", "")) {
			ret = 1;
		}
	}
	if (ret == 0) {
		free(tmp);
		tmp = calloc(sizeof(char), 3);
		if (check_strcpy(tmp, "hy", "hy")) {
			ret = 1;
		}
	}
	free(tmp);
	/*
		char *koala = "";
		strcpy(koala, "coucou");
		This test don't compile with -Werror flag:
		src/test_implementation.c: In function ‘test_strcpy’:
		src/test_implementation.c:139:9: error: ‘__builtin_memcpy’ writing 7 bytes into a region of size 1 overflows the destination [-Werror=stringop-overflow=]
  		139 | strcpy(koala, "coucou");
		Obviously if we remove gcc protect flag we get a beautifull segfault

	*/
	/*	This case is undefined behaviors and cause segfault strcpy("", "hey"): 
		man strcpy 3:
		These  functions  copy  the string pointed to by src, into a string at the buffer pointed to by dst.  The programmer is responsible for allocating a
        destination buffer large enough, that is, strlen(src) + 1
		
		Your functions should not quit unexpectedly (segmentation fault, bus error, double
		free, etc) apart from undefined behaviors.
	*/
	return (ret);

}

int  test_strcmp()
{    
	if (ft_strcmp("koala", "kopoa") != ('a' - 'p')) {
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


int check_strdup(char *str)
{
	int		ret = 0;
	char	*real = NULL;
	if (str) {
		real = strdup(str);
	}
	char	*me = NULL;
	me = ft_strdup(str);
	if (ft_strcmp(real, me) != 0) {
		printf(RED"Error strdup got %s expected %s\n"RESET, me, real);
		ret = 1;
	} 
	if (real && me) {
		free(real);
		free(me);
	}
	return (ret);
}

int test_strdup()
{
	if (check_strdup("koala")\
		|| check_strdup("YOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO")\
		|| check_strdup("")\
		|| check_strdup(NULL)\
		|| check_strdup("s")) {
		return (1);
	}
	return (0);
}

void        tester_hub(int test_fun(void), char *str)
{
	int     error = 0;
	// char    *color, *msg;
	char *msg;
	error = test_fun();
	// color = error == 0 ? GREEN : RED;
	msg = error == 0 ? GREEN"OK" : RED"KO";
	printf("%s%s\n"RESET, str, msg);
}
