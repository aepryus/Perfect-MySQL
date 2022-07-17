#include "mysql.h"

#if LIBMYSQL_VERSION_ID > 80000
typedef char my_bool;
#endif
