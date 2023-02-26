#!/usr/bin/env node

let argv = process.argv;

function doSomething() {
  console.log("done something");
}

console.log(argv);
console.log(doSomething);
console.log("The number of arguemnts passed in is", argv.length);
