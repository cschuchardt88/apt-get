#!/bin/bash

# dotnet build (neo-cli/amd64)
echo -e 'Building (neo-cli/amd64) ...';
dotnet publish ${GITHUB_WORKSPACE}/neo/src/Neo.CLI \
    --framework net7.0 \
    --configuration Release \
    --runtime linux-x64 \
    --self-contained true \
    --output ${NEO_PATH}/neo-cli_amd64 \
    --verbosity normal \
    -p:RuntimeIdentifier=linux-x64 \
    -p:SelfContained=true \
    -p:IncludeNativeLibrariesForSelfExtract=false \
    -p:PublishTrimmed=false \
    -p:PublishSingleFile=true \
    -p:PublishReadyToRun=true \
    -p:EnableCompressionInSingleFile=true \
    -p:DebugType=embedded \
    -p:ServerGarbageCollection=true;
rm -v ${NEO_PATH}/neo-cli_amd64/*.json;
rm -v ${NEO_PATH}/neo-cli_amd64/*.xml;
mkdir -vp ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_amd64;
mkdir -vp ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_amd64/DEBIAN;
mkdir -vp ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_amd64/srv/neo-cli/db;
mkdir -vp ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_amd64/usr/bin;
cp -vp ${GITHUB_WORKSPACE}/${GITHUB_REF_NAME}/templates/debian/neo-cli/files/amd64/control ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_amd64/DEBIAN/;
cp -vpR ${NEO_PATH}/neo-cli_amd64/* ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_amd64/srv/neo-cli/;
cp -vp ${GITHUB_WORKSPACE}/${GITHUB_REF_NAME}/templates/debian/neo-cli/files/*.json ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_amd64/srv/neo-cli/;
ln -s /srv/neo-cli/neo-cli ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_amd64/usr/bin/neo-cli;
chmod -R a+rw ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_amd64/srv/neo-cli/db;
chmod -R a+rw ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_amd64/srv/neo-cli/Plugins;
dpkg-deb --build ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_amd64;
dpkg-deb --info ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_amd64.deb;
cp -vp ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_amd64.deb ${GITHUB_WORKSPACE}/apt-repo/ubuntu/pool/main/;

# dotnet build (neo-cli/arm64)
echo -e 'Building (neo-cli/arm64) ...';
dotnet publish ${GITHUB_WORKSPACE}/neo/src/Neo.CLI \
    --framework net7.0 \
    --configuration Release \
    --runtime linux-arm64 \
    --self-contained true \
    --output ${NEO_PATH}/neo-cli_arm64 \
    --verbosity normal \
    -p:RuntimeIdentifier=linux-arm64 \
    -p:SelfContained=true \
    -p:IncludeNativeLibrariesForSelfExtract=false \
    -p:PublishTrimmed=false \
    -p:PublishSingleFile=true \
    -p:PublishReadyToRun=true \
    -p:EnableCompressionInSingleFile=true \
    -p:DebugType=embedded \
    -p:ServerGarbageCollection=true;
rm -v ${NEO_PATH}/neo-cli_arm64/*.json;
rm -v ${NEO_PATH}/neo-cli_arm64/*.xml;
mkdir -vp ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_arm64;
mkdir -vp ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_arm64/DEBIAN;
mkdir -vp ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_arm64/srv/neo-cli/db;
mkdir -vp ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_arm64/usr/bin;
cp -vp ${GITHUB_WORKSPACE}/${GITHUB_REF_NAME}/templates/debian/neo-cli/files/arm64/control ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_arm64/DEBIAN/;
cp -vpR ${NEO_PATH}/neo-cli_arm64/* ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_arm64/srv/neo-cli/;
cp -vp ${GITHUB_WORKSPACE}/${GITHUB_REF_NAME}/templates/debian/neo-cli/files/*.json ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_arm64/srv/neo-cli/;
ln -s /srv/neo-cli/neo-cli ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_arm64/usr/bin/neo-cli;
chmod -R a+rw ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_arm64/srv/neo-cli/db;
chmod -R a+rw ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_arm64/srv/neo-cli/Plugins;
dpkg-deb --build ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_arm64;
dpkg-deb --info ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_arm64.deb;
cp -vp ${DPKGS_PATH}/neo-cli_${NEO_VERSION}-1_arm64.deb ${GITHUB_WORKSPACE}/apt-repo/ubuntu/pool/main/;
