#include "../../libasm.h"

static int check_write_erno(int fd, char *str)
{
    write(fd, str, ft_strlen(str));
    ssize_t write_errno = errno;
    ft_write(fd, str, ft_strlen(str));
    ssize_t my_errno = errno;
    if (write_errno != my_errno) {
        printf("Set error ernno error expected %ld got %ld\n", write_errno, my_errno);
        return (1);
    }
    return (0);
}

static int check_write_return(int fd, char *str, int len)
{
    ssize_t     real = write(fd, str, len);
    ssize_t     me =  ft_write(fd, str, len);
    return (real == me);
}

static int test_write()
{
    if (check_write_erno(-1, "lol")\
        || check_write_erno(2, "\\dsaas")
        || check_write_erno(2, "sda")
        || check_write_erno(3, NULL))
        return (1);

    if (!check_write_return(2, "coucou", ft_strlen("coucou"))\
        || !check_write_return(2, "2", ft_strlen("2"))\
        || !check_write_return(-1, "2", ft_strlen("2"))\
        || !check_write_return(2, "2sdas\0dafd", ft_strlen("2sdas\0dafd"))\
        || !check_write_return(2, "\n\t\t\n\b", ft_strlen("\n\t\t\n\b"))\
        || !check_write_return(2, NULL, ft_strlen(NULL))) {
        return (1);
    }
    return (0);
}

static int check_read(char *path, size_t size)
{
    errno = 0;

    int fd = open(path, O_RDONLY);
    char    *buff_read = malloc(sizeof(char)*size+1), *my_buff = malloc(sizeof(char)*size+1);
    size_t  ret_read = read(fd, buff_read, size);
    int     read_errno = errno;
    close(fd);
    fd = open(path, O_RDONLY); /* reset file */
    
    size_t  my_ret = ft_read(fd, my_buff, size);
    int     my_errno = errno;
    int     ret = 0;
    
    /* check errno value */
    if (read_errno != my_errno) {
        printf("Read error set ernno got %d expected %d\n", my_errno, read_errno);
        ret = 1;
    } 
    /* check read return value */
    if (ret == 0 && ret_read != my_ret) {
        printf("Read error return value got %ld expected %ld\n", my_ret, ret_read);
        ret = 1;
    }
    buff_read[ret_read] = 0;
    my_buff[my_ret] = 0;
    /* check string with strcmp, execpt when we got dir ( undifined ), 9 21 special erno value*/
    if (my_errno != 9 && my_errno != 21 &&  ret == 0 && ft_strcmp(buff_read, my_buff) != 0) {
        printf("Read error set ernno got %d expected %d\n", my_errno, read_errno);
        printf("Read str got %s expected %s\n", my_buff, buff_read);
        ret = 1;
    }
    free(buff_read);
    free(my_buff);
    close(fd);
    return (ret);
    return (0);
}

static int test_read()
{
    if (check_read("test/text.txt", 40)\
        || check_read("test/text.txt", 80)\
        || check_read("test/text.txt", 87)\
        || check_read("test/text.txt", 4)\
        || check_read("lol fd -2", 14)\
        || check_read("te", 1000)\
        || check_read(NULL, 1000)\
        || check_read("fd 3", 200)\
        || check_read("test", 1000)){
        return (1);
    }
    return (0);
}

int main(void)
{
    tester_hub(test_write, YELLOW"ft_write "RESET);
    tester_hub(test_read, YELLOW"ft_read  "RESET);

    return (0);
}