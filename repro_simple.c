#include <hdf5.h>
#include <stdio.h>

int main(void) {
    hid_t file  = H5Fcreate("test.h5", H5F_ACC_TRUNC, H5P_DEFAULT, H5P_DEFAULT);
    hid_t space = H5Screate(H5S_SCALAR);
    int val = 1;

    hid_t attr = H5Acreate2(file, "Xcrash", H5T_NATIVE_INT, space, H5P_DEFAULT, H5P_DEFAULT);
    H5Awrite(attr, H5T_NATIVE_INT, &val);
    H5Aclose(attr);

    H5Sclose(space);
    H5Fclose(file);
    printf("done\n");
    return 0;
}
