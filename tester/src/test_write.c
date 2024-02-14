#include "../../libasm.h"

static int check_write_erno(int fd, char *str)
{
    write(fd, str, ft_strlen(str));
    int write_errno = errno;
    ft_write(fd, str, ft_strlen(str));
    int my_errno = errno;
    if (write_errno != my_errno) {
        printf("Set error ernno error expected %d got %d\n", write_errno, my_errno);
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

int main(void)
{
    tester_hub(test_write, YELLOW"ft_write "RESET);
    return (0);
}