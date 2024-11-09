#!/bin/bash

DEV_HOME=/workspaces
CK_BRANCH=v24.8.6.70-lts

# check if DEV_HOME is mounted
if [ ! -d ${DEV_HOME} ]; then
    echo "Mounting ${DEV_HOME} failed. Please check your docker-compose.yml file."
    exit 1
fi

# Initialize environment
if [ ! -d ${DEV_HOME}/.inited ]; then
    echo "Initializing ClickHouse development environment..."
    rm -rf ${DEV_HOME}/ClickHouse

    echo "Cloning ClickHouse repository(branch: ${CK_BRANCH}) into ${DEV_HOME}. You can see the progress in docker logs."
    git clone --progress --verbose --branch ${CK_BRANCH} --recursive --shallow-submodules https://github.com/ClickHouse/ClickHouse.git 2>&1
    # exit 1 if git clone failed
    if [ $? -ne 0 ]; then
        echo "Cloning ClickHouse repository failed. Please check your network connection."
        exit 1
    fi

    echo "Cloned ClickHouse repository successfully!"
    date > ${DEV_HOME}/.inited
fi