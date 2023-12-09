#!/usr/bin/env bash

echo "Укажите директорию: "
read -r DIR

path_log=$(ls "$DIR" | grep log)
path_py=$(ls "$DIR" | grep py)
#читаем список log файлов
for line in $path_log
do
	file_name=$(echo "$line" | awk -F '.' '{print $1"_"}')
	timestamp=$(stat "$line" | grep Birth | awk '{print $2"."$3}' | awk -F "." '{print $1"."$2}')
	mv "$line" "$file_name""$timestamp".log	
done

#читаем список py файлов
for line in $path_py
do
        file_name=$(echo "$line" | awk -F '.' '{print $1"_"}')
	hash_commit=$(git log "$line" | grep commit | awk '{print $2}')
        mv "$line" "$file_name""$hash_commit".py
done

