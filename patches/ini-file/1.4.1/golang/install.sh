#!/bin/bash
export PACKAGE=ini-file
export TARGET_DIR=common
export REF=v${VERSION}
export CGO_ENABLED=0 
rm -rf ${PACKAGE} || true
mkdir -p ${PACKAGE}
git clone -b "${REF}" https://github.com/bitnami/ini-file ${PACKAGE}
pushd ${PACKAGE}
go mod download
go build -v -ldflags '-d -s -w' .
mkdir -p /opt/bitnami/${TARGET_DIR}/licenses
mkdir -p /opt/bitnami/${TARGET_DIR}/bin
cp -f COPYING /opt/bitnami/${TARGET_DIR}/licenses/${PACKAGE}-${VERSION}.txt
cp -f ${PACKAGE} /opt/bitnami/${TARGET_DIR}/bin/${PACKAGE}
popd
rm -rf ${PACKAGE}
