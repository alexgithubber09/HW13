#!/usr/bin/env bash
echo "enter the string: "
read -r  my_var
regex=$(echo "$my_var" | tr ",./\\\\{?&^%$#:;@\!\[\]\{\}\(\)\*\+\- " " " | grep -e "[а-яА-Яa-zA-Z]-[а-яА-Яa-zA-Z]*" -e "[а-яА-Яa-zA-Z]" | wc -w)
echo "The number of words is:" 
echo "$regex" 
