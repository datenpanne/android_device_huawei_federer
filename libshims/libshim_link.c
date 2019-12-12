
#include <stdio.h>
#include <unistd.h>
#include <dlfcn.h>
#include <string.h>

// typedef FILE* (*fopen_t)(const char *filename, const char *mode);
typedef int (*unlink_t)(const char *filename);

static const char* translate_file(const char* file) {
    if (!strcmp(file, "libdmd_report.so"))
        file = "libdmd.so";

    return file;
}

int unlink(const char *filename)
{
    static unlink_t o_unlink = NULL;
    if (o_unlink==NULL)
        o_unlink = (unlink_t) dlsym(RTLD_NEXT, "unlink");

    return o_unlink(translate_file(filename));
}
