
#$1 like js,html,java,xml

file_type=$1

#format 2011-12-12
start_time=$2
#输出主目录 /d/a/b/
bash_path=$3

start_time_s=`date +%s -d $start_time`
current_path=`pwd`

for x in `find -name *.$file_type`
do
time_s=`stat  $x | grep 'Change' |awk -F "hange: " '{print $2}' |awk -F "[0-9]{2}:[0-9]{2}" '{print $1}'`
change_time=`date +%s -d $time_s`

if [ $change_time -gt $start_time_s ] 
then
  
    file_name=$x

    foler=`echo "$file_name" | awk -F "/[a-zA-Z0-9_]*(.$file_type)$" '{print $1}'`
    

    echo $foler
	echo $file_name
	echo $time_s
 # 创建文件夹
  target_path="$bash_path${foler:2}"
 if [ ! -d "$target_path" ]; then

      mkdir -p "$target_path"
  fi

  cp -rf $file_name  "$target_path"
fi
done
