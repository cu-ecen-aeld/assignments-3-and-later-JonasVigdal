#include <syslog.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char const *argv[])
{
    int fd;
    ssize_t nr;
    const char *path = argv[1];
    const char *write_string = argv[2]; 

    openlog(NULL, 0, LOG_USER);

    if(argc != 3)
    {
        syslog(LOG_ERR, "Invalid number of arguments: %d", argc);
        return 1;
    }
    
    fd = open(path, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    
    if (fd == -1)
    {
        syslog(LOG_ERR, "No such file found: %s", path);
        return 1;
    }

    
    nr = write (fd, write_string, strlen(write_string));
    if (nr == -1)
    {
        close(fd);
        syslog(LOG_ERR, "Could not write to file");
        return 1;
    }
    else if (nr != strlen(write_string))
    {
        syslog(LOG_ERR, "Possible error when writing to file");
    }

    syslog(LOG_DEBUG, "Writing %s to %s", write_string, path);

    close(fd);
    return 0;
}
