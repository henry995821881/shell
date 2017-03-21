

for i in `seq 1 100000`
do
	curl http://192.168.80.249:8080 >> test.log

done
