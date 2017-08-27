#!/bin/bash



#    HOW TO USE
#    1) > brew install sfml
#    2) > brew install glew
#    3) cd to work project directory
#    4) ./sfmlcompile app_executable_name



#Setup variables

sfml_frameworks="-lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio"
sfml_location="/usr/local/Cellar/sfml/2.4.2_1"
sfml_include_location="$sfml_location/include"
sfml_lib_location="$sfml_location/lib"

#Check if the location directories exits

if [ ! -d $sfml_location ]
then
    echo "[ERROR]: Invalid sfml location folder. Please modify. /n"
    exit 0
fi

#Check if the number of parameters is ok

if [ "$#" -ne 1 ]
then
    echo "[ERROR]: Invalid number of parameters. (./sfmlcompile appname)/n"
    exit 0
fi


#Find all .cpp files

cppfiles=""

for i in *.cpp
do

    if [ -f "$i" ]
    then
	cppfiles="$cppfiles $i"
    fi
    
done

echo "[OK]: Found .cpp files: $cppfiles /n"

#Compile

echo "[OK]: Start compiling /n"

g++ $cppfiles -o $1 -L $sfml_lib_location -I $sfml_include_location $sfml_frameworks

