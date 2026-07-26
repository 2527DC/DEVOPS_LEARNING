Promise : resolve , reject , pending  state 
- handled by using the .then , .catch , .finally 
- Promise chaining was interduseed or the strategy where to overcome the promise hell 
- a promise is created using the new Promise ((reject ,resolve ))


  - Finally : 
       - Passing Through a Fulfillment Value : ie when a ptromise is resolveed and successfull using th finally will clean up the logic of that promise  but it does not tuches the returned value where it will be passed to the next  that is promise chaing where then is handled 
       
       Promise.resolve('Hello, World!')
  .finally(() => {
    console.log('1. Finally block running (cleanup)');
    // Any return value here is ignored by the chain
    return 'This value is ignored'; 
  })
  .then((value) => {
    // The original resolved value is preserved!
    console.log('2. Next .then() received:', value); 
  });

// Output in console:
// 1. Finally block running (cleanup)
// 2. Next .then() received: Hello, World!

- Passing Through a Rejection Error: When a promise fails, .finally() still runs, but the original error continues down the chain until it reaches a .catch().
Promise.reject(new Error('Database connection failed!'))
  .finally(() => {
    console.log('1. Finally block running (closing resources)');
  })
  .catch((error) => {
    // The original error is preserved and caught here!
    console.log('2. Next .catch() received:', error.message); 
  });

// Output in console:
// 1. Finally block running (closing resources)
// 2. Next .catch() received: Database connection failed!




# Static method of the Promise 

1. Promise.all : wait untill all the promisses are resolved or any of the promisses are rejected 


- it only throws error or returns error if any one of the promise  failed and it only  doesnt throws error when all the promises are passed 
- ie if any one of the passed promis is rejected then  promise.all will throw an error 
- the other promise may get rejected , may get resolved but the promise.all will thro an imediate error if a promis fails 
- Promise.all take more than one promise and retuns array of the result 


2. Promise.allSettled : wait untill all the promisses are resolved or rejected and the  give the result of all the promisses 
- wait untill all the promises state are completed whether the state may be  resolved or rejected

3. Promise.race : wait untill the first promisse is resolved or rejected and give the result of that promisse 
- it will return the value of first settled promise  
- ie first promise is not the promise that we pass it that the promise which response it first where the response state may be rejected , resolved 
- Promise.race() can be used to implement API timeouts. For instance, we can create a custom timeout promise that rejects after a specific duration (in seconds or milliseconds) and pass it alongside our API requests into Promise.race(). Since Promise.race() returns the first settled promise, it will either return the fastest API response or trigger a timeout error if the threshold is exceeded.
4. Promise.any : wait untill the first promisse is resolved and give the result of that promisse but it ignore the rejected promises 
- returen the first promises value which gets resolved  quickly ie first 
-  if all the promise get rejected then it will throw AggregateError error which is built in error 

Promise.alln : 