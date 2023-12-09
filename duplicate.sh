#!/usr/bin/env bash

echo "Введите имя проверяемого файла:"
read -r FILE

sed -r ':a; s/\b([[:alnum:]]+)\b(.*)\b\1\b/\1\2/g; ta; s/(, )+/, /g; s/, *$//' $FILE | tr -s " "
