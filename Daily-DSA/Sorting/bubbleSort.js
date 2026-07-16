var removeDuplicates = function (nums) {
  if (nums.length === 0) return 0;
  let k = 1;
  for (let i = 1; i < nums.length; i++) {
    if (nums[i] !== nums[k - 1]) {
      nums[k] = nums[i];
      k++;
      console.log(" this is the k value ", k);
    }
  }
  console.log(" this is the num value ", nums);

  return k;
};

console.log(removeDuplicates([1, 1, 2]));
