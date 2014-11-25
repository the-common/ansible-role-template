#!/bin/bash
name_project_original="Generic Software Project Template"

if [ $# -gt 2 ]; then
	echo "參數數量錯誤！"
	exit 1
elif [ $# -eq 2 ]; then
	name_project_original="$1"
	name_project="$2"
elif [ $# -eq 1 ]; then
	name_project="$1"
else 
	read -p "請輸入原來的專案名稱（不輸入則使用預設值「${name_project_original}」）：" name_project_original_user_input
	if [ -n "${name_project_original_user_input}" ]; then
		name_project_original="${name_project_original_user_input}"
	fi
	read -p "請輸入新的專案名稱：" name_project
	if [ -z "${name_project_original}" ]; then
		echo "輸入錯誤！"
		exit 1
	fi
fi

sed --in-place "s/${name_project_original}/${name_project}/g" CMakeLists.txt

sed --in-place "s/global_software_information.software_name = \"${name_project_original}\";/global_software_information.software_name = \"${name_project}\";/g" Source_code/main.cpp

sed --in-place "s/${name_project_original}/${name_project}/g" "Build solutions/Eclipse CDT IDE/.*project"

sed --in-place "s/${name_project_original}/${name_project}/g" "Build solutions/Eclipse JDT IDE/.*project"

sed --in-place "s/${name_project_original}/${name_project}/g" "Build solutions/Code__Blocks IDE/${name_project_original}.cbp"
sed --in-place "s/${name_project_original}/${name_project}/g" "Build solutions/Code__Blocks IDE/README.md"
mv "Build solutions/Code__Blocks IDE/${name_project_original}.cbp" "Build solutions/Code__Blocks IDE/${name_project}.cbp"
mv "Build solutions/Code__Blocks IDE/${name_project_original}.layout" "Build solutions/Code__Blocks IDE/${name_project}.layout"
mv "Build solutions/Code__Blocks IDE/${name_project_original}.depend" "Build solutions/Code__Blocks IDE/${name_project}.depend"

sed --in-place "s/${name_project_original}/${name_project}/g" "Build solutions/CodeLite IDE/${name_project_original}.project"
mv "Build solutions/CodeLite IDE/${name_project_original}.project" "Build solutions/CodeLite IDE/${name_project}.project"
exit 0