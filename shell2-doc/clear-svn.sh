#删除每个文件夹以及子文件夹中的svn文件夹
#find -name svn | awk 'BEGIN {count=0;} {name[count]=$1;count++;}; END{for (i=0;i<NR;i++) print i ,name[i]}'
 for x in `find -name svn`
{
 echo $x"delete...."
  rm -rf $x 
 }

