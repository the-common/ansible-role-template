#!/bin/bash
######## File scope variable definitions ########
# idea from http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming/
readonly PROGRAM_NAME="$(basename $0)"
readonly PROGRAM_DIRECTORY="$(readlink -m $(dirname $0))"
readonly PROGRAM_ARGUMENT_ORIGINAL_LIST="$@"
readonly PROGRAM_ARGUMENT_ORIGINAL_NUMBER=$#
readonly project_root_path="${PROGRAM_DIRECTORY}/.."

######## File scope variable definitions ended ########

######## Included files ########
source "${project_root_path}/Tools/checkIllegalUsage.bash.source.sh"
######## Included files ended ########

checkIllegalUsage

# 移除 Generic Software Project Template 原本的 Git 程式碼倉庫
rm -rf .git/
./Tools/renameProject.bash.sh
git init
exit 0