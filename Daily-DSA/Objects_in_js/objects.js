const user = {
  name: "chethan",
  subject: {
    class10: [10, 20, 40, 80],
  },

  age: 22,
  addresss: " Doddabyalakere",
  isActive: true,
};

// Object.entries(user).forEach(([key, value]) => {
//   console.log(key, value);
// });

const permissions = {
  user_managemnt: ["create", "read", "update"],
  key2: ["create", "read", "update"],
  key3: ["create", "read", "update"],
};

// function haspermission(module, action) {
//   if (!module && !action)
//     return console.log(" Need to pass the moduel and action it cant be empty ");

//   const isPresent = permissions[module]?.includes(action);

//   return isPresent ? true : false;
// }

// const value = haspermission("user_managemnt", "Create");
// console.log("The given  action  for the permiision  ", value);

const fruits = ["Apple", "Banana", "Mango"];

for (a in fruits) {
}
