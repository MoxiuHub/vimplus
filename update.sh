#!/bin/bash

# 判断文件是否存在
function is_exist_file()
{
    filename=$1
    if [ -f $filename ]; then
        echo 1
    else
        echo 0
    fi
}

# 更新mac平台字体
function update_fonts_on_mac()
{
    rm -rf ~/Library/Fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf
    cp ./fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf ~/Library/Fonts
}

# 更新android平台字体
function update_fonts_on_android()
{
    rm -rf ~/.termux/font.ttf
    mkdir ~/.termux
    cp ./fonts/DejaVu.ttf ~/.termux/font.ttf

    # 刷新style
    REL="am broadcast --user 0 -a com.termux.app.reload_style com.termux"
    $REL > /dev/null
}

# 更新linux平台字体
function update_fonts_on_linux()
{
    mkdir -p ~/.local/share/fonts
    rm -rf ~/.local/share/fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf
    cp ./fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf ~/.local/share/fonts

    fc-cache -vf ~/.local/share/fonts
}

# 更新vim插件
function update_vim_plugin()
{
    vim -c "PlugUpdate" -c "q" -c "q"
}

# 拷贝文件
function copy_files()
{
    rm -rf ~/.vimrc
    ln -s ${PWD}/.vimrc ~

    rm -rf ~/.vim/colors
    ln -s ${PWD}/colors ~/.vim

    rm -rf ~/.vim.base 
    ln -s ~/.vimplus/.vim/.vim.base ~/.vim.base    
    rm -rf ~/.vim.plugins
    ln -s ~/.vimplus/.vim/.vim.plugins ~/.vim.plugins 
    rm -rf ~/.vim.setting
    ln -s ~/.vimplus/.vim/.vim.setting ~/.vim.setting

    rm -rf ~/.vim/ftplugin
    ln -s ${PWD}/ftplugin ~/.vim

    rm -rf ~/.vim/autoload
    ln -s ${PWD}/autoload ~/.vim
}

# 打印logo
function print_logo()
{
    color="$(tput setaf 6)"
    normal="$(tput sgr0)"
    printf "${color}"
    echo 'vimplus is now updated!'
    echo 'Just enjoy it!'
    printf "${normal}"
}

# 在mac更新vimplus
function update_vimplus_on_mac()
{
    git pull origin master
    copy_files
    update_fonts_on_mac
    update_vim_plugin
    print_logo
}

# 在linux更新vimplus
function update_vimplus_on_linux()
{
    git pull origin master
    copy_files
    update_fonts_on_linux
    update_vim_plugin
    print_logo
}

# 在android更新vimplus
function update_vimplus_on_android()
{
    git pull origin master
    copy_files
    update_fonts_on_android
    update_vim_plugin
    print_logo
}

# 获取当前时间戳
function get_now_timestamp()
{
    cur_sec_and_ns=`date '+%s-%N'`
    echo ${cur_sec_and_ns%-*}
}

# main函数
function main()
{
    begin=`get_now_timestamp`

    type=$(uname)
    echo "Platform type: "${type}

    if [ ${type} == "Darwin" ]; then
        update_vimplus_on_mac
    elif [ ${type} == "Linux" ]; then
        tp=$(uname -a)
        if [[ $tp =~ "Android" ]]; then
            echo "Android"
            update_vimplus_on_android
        else
            update_vimplus_on_linux
        fi
    else
        echo "Not support platform type: "${type}
    fi

    end=`get_now_timestamp`
    second=`expr ${end} - ${begin}`
    min=`expr ${second} / 60`
    echo "It takes "${min}" minutes."
}

# 调用main函数
main
