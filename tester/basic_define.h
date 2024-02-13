#ifndef BASIC_DEF_TYPE_HEADER
# define BASIC_DEF_TYPE_HEADER

# include <sys/types.h>

/********************************************************************
 *                        DEFINE		                            *
 ********************************************************************/
/* bool */
# define    FALSE   0
# define    TRUE 	1
/* pointer size */
# define    PTR_SIZE	    sizeof(void *)
/* LS linux color */
# define    RED             "\033[1;31m"
# define    GREEN           "\033[1;32m"
# define    YELLOW          "\033[1;33m"
# define    BLUE            "\033[1;34m"
# define    PURPLE          "\033[1;35m"
# define    CYAN            "\033[1;36m"
# define    RESET           "\033[0m"
# define    FILL_GREEN      "\033[7;32m"
# define    FILL_YELLOW     "\033[7;33m"
# define    FILL_RED        "\033[7;31m"
# define    FILL_YELBLACK   "\033[40;33m"


 # endif /* BASIC_DEF_TYPE_HEADER */