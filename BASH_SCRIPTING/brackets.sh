#  About the Brackets how they  can be used differently in bash

: << MUTIPELINE_COMMENT

    The ( ) brackets are used to create a subshell in bash.
    --> it use to avoid  the variable scope issue.
    --> any variable defined inside the ( ) will not be available outside.
    -->  The  cmds inside the ( ) are executed in a separate process.
    -->  The $$ variable is used to get the process ID of the current shell.
    -->  even u use $$ inside the ( ) it will give the pid of the parent shell not the subshell.

MUTIPELINE_COMMENT


x=10
(y=20; echo "Inside subshell: $y and the pid is" $$)  # runs in subshell
echo "Outside: $y and the pid is " : $$                # y is not set outside

: << MUTIPELINE_COMMENT

The  (( )) brackets are used for arithmetic operations in bash.
--> it allows you to perform mathematical calculations.
-->  You can use standard arithmetic operators like +, -, *, /, %, etc.
-->  You can also use variables inside (( )) without the $ sign.
-->  The result of the arithmetic operation can be assigned to a variable.
-->  The (( )) construct returns an exit status of 0 if the result is non-zero, and 1 if the result is zero.        
-->  It is commonly used in loops and conditional statements for arithmetic comparisons.
-->  It is commonly used in loops and conditional statements for arithmetic comparisons.


MUTIPELINE_COMMENT

x=10
if (( x > 5 )); then
    echo "x is greater than 5"
fi


x=0
y=10

if [ "$x" -ne 0 ]; then   #  if we are using single brackets  and we must use the variable in $ sign
    result=$(( y / x ))
    echo "Result: $result"
else
    echo "Error: Division by zero!"
fi


######   TO EXIT FROM THE SCRIP IF THE COMMAND FAILS WE USE  ----->>> set  -e   ########



: << MUTIPELINE_COMMENT

The { } brackets are used to group commands together in bash.
--> it allows you to execute multiple commands in a single block.
-->  The commands inside the { } are executed in the current shell.
-->  You need to have spaces after { and before }.


MUTIPELINE_COMMENT

name="Chethan"
echo "Hello $name123"   # ❌ will look for variable $name123
echo "Hello ${name}123" # ✅ uses $name, prints Hello Chethan123


: << MUTIPELINE_COMMENT

The [[ ]] brackets are used for conditional expressions in bash.
--> it provides more features and flexibility compared to [ ].
-->  It supports pattern matching using == and != operators.
-->  It allows the use of logical operators like && and || for combining conditions.
-->  It supports regex matching using the =~ operator.
-->  You do not need to quote variables inside [[ ]] to prevent word splitting and globbing.
-->  It is generally safer and more robust than [ ] for complex conditions.
-->  It is not POSIX compliant, so it may not be available in all shells.
-->  It is commonly used in if statements and while loops for conditional checks.

MUTIPELINE_COMMENT
