#!/bin/bash
read -p "Dime una palabra: " palabra
echo "$palabra" >> lista.txt
cat lista.txt