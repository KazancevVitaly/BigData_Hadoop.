#!/bin/bash

echo "Hello," > test_file_1.txt
echo "hdfs" > test_file_2.txt
echo "!" > test_file_3.txt
hdfs dfs -mkdir task_2
hdfs dfs -put test_file_* task_2
hdfs dfs -du task_2
hdfs dfs -setrep 2 task_2/test_file_*
hdfs dfs -ls -h task_2
echo $(date +"%Y-%m-%d") `hdfs dfs -cat task_2/test_file_1.txt` > log.txt
echo $(date +"%Y-%m-%d") `hdfs dfs -cat task_2/test_file_2.txt` >> log.txt
echo $(date +"%Y-%m-%d") `hdfs dfs -cat task_2/test_file_3.txt` >>> log.txt
rm test_file_*
hdfs dfs -rm -r -skipTrash task_2
