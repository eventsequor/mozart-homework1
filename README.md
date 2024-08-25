# Homework 1
Autor: Eder Leandro Carbonero Baquero
## Prerequisites
You must have Mozart Oz configured on your system and its environment variables, without this the programs will not work the implementations, to check that everything is ok please execute the commands `ozc -v` this command will return the version of Mozart's compiler, the second command is `ozengine --help` this will return and information about the oz engine and his arguments

You will see something like this. first command
``` sh
youruser@123 mozart % ozc -v       
Mozart Compiler 2.0.1+build.28.cb42466b (Fri, 2 Sep 2022 14:07:47 +0200) playing Oz 3


%******************** command line option error *****************
%**
%** no input files given
%**
%** Hint: Use --help to obtain usage information
```
second command
``` sh
eventsequor@192 ~ % ozengine --help 
Allowed options:

Generic options:
  --help                 produce help message

Configuration:
  --home arg             path to the home of the installation
  --init arg             path to the Init.ozf functor
  --search-path arg      search path
  --search-load arg      search load
  --min-memory arg       minimal heap size in MB
  --max-memory arg       maximum heap size in MB
  --gui                  GUI mode
``` 
## how to run a program?
To run the program you have to use the sh shell is a native shell for mac and linux however if you are working in windows you have to setup the sh shell or with a git console you can use it to execute the program `run.sh` file has all steps to run every points of the homework.

Execute the next command to run all points
``` sh
sh run.sh
```
First you have to compile the program
```mozart
ozc -c name_class.oz 
```

Then you have to execute the compile output file with extension *.ozf
```mozart
ozengine name_class.ozf
```
