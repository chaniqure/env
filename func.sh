#!/bin/bash

# 校验端口是否占用
function checkPort() {
    checkPortProcess $1
    if [ $RESULT -gt 0 ] ; then
        RESULT=1
    else
        RESULT=0
    fi
}

# 通过端口杀死进程
function killByPort() {
    echoInfo "trying to kill process by port \"$1\""
    if [ $1 -gt 0 ] ; then
        checkPortProcess $1
        if [ $RESULT -gt 0 ] ; then
            echoInfo "process is running on port $1, try kill it..."
            getPortProcessId $1
            kill -9 $RESULT
        else
            echoInfo "process is not running!"
        fi
    fi
}

# 记录日志文件
function _logfile() {
    if [ ! -d ${home}/log ] ; then
        mkdir -p ${home}/log
    fi
    echo $1 >> ${home}/log/startup.log
}

# 获取端口进程id
function getPortProcessId() {
    RESULT=`netstat -nlp | grep $1 | awk '{print $7}' | awk -F '/' '{print $1}'`
}

# 校验端口是否被占用
function checkPortProcess() {
    RESULT=`netstat -nlp | grep $1 | awk "{print $7}" | wc -l`
}

# 记录info日志文件
function info() {
    TIME=`date '+%Y-%m-%d %H:%M:%S'`
    echo -e "\033[34m ${TIME}\033[1m \033[32m [INFO] \033[0m $1"
    _logfile "${TIME} [INFO] $1"
}

function error() {
    TIME=`date '+%Y-%m-%d %H:%M:%S'`
    echo -e "\033[34m ${TIME}\033[1m \033[31m [ERROR] \033[0m $1"
    _logfile "${TIME} [INFO] $1"
}

# 循环校验进程是否启动，直到启动成功
function checkProcess(){
    RUNNING=0
    while [ $RUNNING -eq 0 ]
    do
        checkPort $2
        RUNNING=$RESULT
        sleep 1

        if [ $RUNNING -eq 0 ] ; then
            info "waiting for $1 starting ..."
        fi
    done

    info "$1 started !"
}

# 打印日志，有颜色
function echoInfo(){
    echo -e " \033[1m \033[32m $1 \033[0m"
}

# 打印日志，有颜色
function echoError(){
    echo -e " \033[1m \033[31m $1 \033[0m"
}


function isRootUser() {
    RESULT=1
    if [ $UID -ne 0 ]; then
        RESULT=0
    fi
}

# 将当前用户添加到docker操作组
function addUserToDocker(){
    isRootUser
    if [ $RESULT -eq 0 ] ; then
        echoError "current user is not root user "
        exit
    fi
    gpasswd -a $1 docker    
    newgrp docker   
    systemctl restart docker
}

# 安装docker
function dockerInstall(){
    isRootUser
    if [ $RESULT -eq 0 ] ; then
        echoError "current user is not root user "
        exit
    fi
    curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
    # curl -sSL https://get.daocloud.io/docker | sh
}

# 更新docker仓库
function changeDockerMirror(){
    isRootUser
    if [ $RESULT -eq 0 ] ; then
        echoError "current user is not root user "
        exit
    fi
    echo -e "{
    \"registry-mirrors\":[\"http://hub-mirror.c.163.com\"]\n}" > /etc/docker/daemon.json
    systemctl restart docker
}

# 安装常用的命令
function commandInit() {
    isRootUser
    if [ $RESULT -eq 0 ] ; then
        echoError "current user is not root user "
        exit
    fi
    apt-get install -y curl lrzsz unzip procps nfs-common vim socat conntrack ebtables ipset sudo
}


# 安装k3s
function k3sInstall(){
    isRootUser
    if [ $RESULT -eq 0 ] ; then
        echoError "current user is not root user "
        exit
    fi
    curl -sfL https://get.k3s.io | sh -
}

case "$1" in
    "dockerInstall")
        dockerInstall
        ;;
    "addUserToDocker")
        if [ "$2" = "" ]; then
            echoError "user is empty"
            exit
        fi
        addUserToDocker $2
        ;;
    "changeDockerMirror")
        changeDockerMirror
        ;;
    "commandInit")
        commandInit
        ;;
    "k3sInstall")
        k3sInstall
        ;;
    *)
        echoError 'command does not find, available command: dockerInstall|addUserToDocker|changeDockerMirror|commandInit|k3sInstall'
esac
