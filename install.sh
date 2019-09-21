#!/bin/bash

export SUDO="sudo"
export InstallCommand=""
export OsName=""
export Pwd=`pwd`
export UNAME=""


function check_user()
{
    if [[ `id -u` -eq 0 ]];then
        export SUDO=""
    else
        export SUDO="sudo"
    fi
}

# mac or linux
function get_platform_type()
{
    echo $(uname)
}

# linux ubuntu or cenots
function get_linux_platform_type()
{
    export OS_NAME=$( cat /etc/os-release | grep ^NAME | cut -d'=' -f2 | sed 's/\"//gI' )    
    case "$OS_NAME" in    
      "CentOS Linux")    
        export InstallCommand=" ${SUDO} yum install -y "
        export OsName="centos"
      ;;    
      "Ubuntu")    
        export OsName="ubuntu"
        export InstallCommand=" ${SUDO} apt install -y "
      ;;    
      *)    
    esac    
}

# install command
function install_tools_on_linux()
{
    check_user
    get_linux_platform_type
    curl -sL install-node.now.sh/lts | ${SUDO}  bash
    echo "InstallCommand : ${InstallCommand}"
    ${InstallCommand}  git wget  cmake  zlib1g-dev  libtinfo-dev ruby 
}

# clone  respository
function clone_install_repository()
{
    git clone --depth=1 https://github.com/erikw/tmux-powerline.git ~/.tmux-powerline
    git clone --depth=1 https://github.com/ggyyll/dotfiles.git 
    cd dotfiles
    bash nvim_install.sh && bash shell_tools.sh
    bash install_go.sh 
    # bash install_ccls.sh
    cd -

}


function main()
{
    type=`get_platform_type`
    echo "platform type: "${type}

    if [ ${type} == "Linux" ]; then
        install_tools_on_linux 
        clone_install_repository
    else
        echo "not support platform type: "${type}
    fi
}

#  call main
main

