# script to install or update a set of default Root Certificates
# for the ssl module.  Uses the certificates provided by the certifi package:
#       https://pypi.python.org/pypi/certifi

import certifi
import os
import os.path
import ssl
import stat
import subprocess
import sys

STAT_0o775 = ( stat.S_IRUSR | stat.S_IWUSR | stat.S_IXUSR
             | stat.S_IRGRP | stat.S_IWGRP | stat.S_IXGRP
             | stat.S_IROTH |                stat.S_IXOTH )


def main():
    openssl_dir, openssl_cafile = os.path.split(
        ssl.get_default_verify_paths().openssl_cafile)

    # change working directory to the default SSL directory
    print(" -- openssl_dir:" + openssl_dir) 
    try:
        os.chdir(openssl_dir)
    except FileNotFoundError:
        os.makedirs(openssl_dir)
        os.chdir(openssl_dir)
    certifi_cafile = certifi.where()
    print(" -- certifi_cafile:" + certifi_cafile)
    print(" -- removing any existing file or link " + openssl_cafile)
    try:
        os.remove(openssl_cafile)
    except FileNotFoundError:
        pass
    print(" -- copying certifi certificate bundle")
    with open(certifi_cafile, 'rb') as source:
      with open(openssl_cafile, 'wb') as dest:
        dest.write(source.read())
    
    print(" -- setting permissions")
    os.chmod(openssl_cafile, STAT_0o775)
    print(" -- update complete")

if __name__ == '__main__':
    main()