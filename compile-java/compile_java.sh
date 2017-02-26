

current_path=`pwd`
i=0
arr_str=""
arr_str_lib=""
j=0
for x in `find -name *.java`
do
	#echo $x
	i=$i+1

	if [ "$arr_str" == "" ];then

          arr_str="$x"
	else
			
	      arr_str="$arr_str,$x"
    fi 

done

#echo $arr_str
#字符串分割成数组
OLD_IFS="$IFS" 
IFS="," 
arr=($arr_str)
IFS="$OLD_IFS" 


for x in `find  ./lib -name *.jar`
do
	#echo $x
	i=$j+1

	if [ "$arr_str_lib" == "" ];then

          arr_str_lib="${x:2}"
	else
			
	      arr_str_lib="$arr_str_lib:${x:2}"
    fi 

done
#####
if [ "$arr_str_lib" == "" ]; then

   arr_str_lib="."

else

  arr_str_lib="${arr_str_lib}:."

fi


# lib
echo "classpath:  ${arr_str_lib}"




#for aa in ${arr[@]}
#do 
#echo "$aa"
#done

#classes 目录
target_path="${current_path}/classes"

if [ ! -d "$target_path" ]; then

      mkdir -p "$target_path"
 fi

for ja in ${arr[@]}
do 

echo "" | javac -cp   ${arr_str_lib}  ${ja:2}  -d  $target_path 
echo "compile: ${ja}"
done
