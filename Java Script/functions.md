 - in js the regural function  arguments that are passed act as array ie array like object but not exactly array where u can perform all the array methods such as map for each etc so for  the array methods we can use the converting arguments to array using the spread 
 
 - but in arrrwo function we must use  the ... rest operator which make the passed argument as array where we can directly perform array methods 


 Functions Declaration and Function Expression (Hoisting Differences)

 sayHello();
sayBye();

function sayHello() {
  console.log("Hello!");
}

var sayBye = function() {
  console.log("Bye!");
};  