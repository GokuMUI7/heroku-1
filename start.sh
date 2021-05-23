#!/bin/bash

cd /usr/src/app

if [ ! -z "${LIBDRIVE_VERSION}" ]; then
    if [ "${LIBDRIVE_VERSION}" = "latest" ]; then
        VER="latest"
    else
        VER="tags/${LIBDRIVE_VERSION}"
    fi
else
    VER="latest"
fi

if [ ! -z "${LIBDRIVE_REPOSITRY}" ]; then
    REPO=${LIBDRIVE_REPOSITRY}
else
    REPO="libDrive/libDrive"
fi

curl -L -s $(curl -s "https://github.com/libDrive/libDrive/releases/download/v1.3.1/libDrive.Server.v1.3.1.tar" | grep -Po '"browser_download_url": "\K.*?(?=")') | tar xf - -C .

pip3 install -r requirements.txt -q --no-cache-dir

gunicorn main:app
