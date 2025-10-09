#!/bin/bash

find . -type f -exec ls -l {} \; | egrep ".{6}rwx" | awk '{print $9}' > archivos_peligrosos.txt
