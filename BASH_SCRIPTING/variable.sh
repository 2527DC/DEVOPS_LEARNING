#!/bin/bash 

# This script demonstrates the use of variables in bash scripting 

# Define a variable
greeting="Hello !"
name="Alice"
age=30
height=5.7
is_student=true

# Print the variable

echo $greeting. My name is $name.  I am $age years old, $height feet tall, and it is $is_student that I am a student.

# built  in variables for comparison

# $? - Exit status of the last command

ls /nonexistent_directory

echo "Exit status of   non success  previous run  cmd : $?"

ls ./variable.sh
echo "Exit status of  success previous run cmd : $?"


# $$ - Process ID of the current script

: << 'MULTILINE_COMMENT'
  we have and anothere built in variable for comparion that is $$ which gives the process id of the current script
    we can use this to create unique temporary files or directories
    PID of the current shell process. You can compare it to track or avoid multiple instances.
    --> this will be usefull when creating a temporary file or directory for the   to avoid name conflicts between multiple
     instances of the script running simultaneously
   -->    because  each script   will have a unique process id
MULTILINE_COMMENT


echo "Process ID of the current script: $$"



# $0 - Name of the script

echo "Name of the script: $0"   # $0 gives the name of the script that is being executed


# $1, $2, ... - Positional parameters (arguments passed to the script)

echo "First argument: $1" and "Second argument: $2"  # $1 and $2 give the first and second arguments passed to the script

# $# - Number of arguments passed to the script
echo "Number of arguments passed to the script: $#"  # $# gives the number of arguments passed to the script

# $LINENO - Current line number in the script
echo  what is this $LINENO
