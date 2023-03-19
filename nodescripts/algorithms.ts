// a list of algorithms

console.log("Algorithms running.....");
const a = new ArrayBuffer(6);

const read8 = new Uint8Array(a);

// Binary Search
//

function bsSearch(
  low: number,
  high: number,
  numToFind: number,
  arr: Array<number>
): Boolean {
  let midpoint = Math.floor((high - low) / 2);

  if (arr[midpoint] === numToFind) {
    return true;
  }

  return false;
}

let arr = new Array(200).fill("a").join("");

console.log(arr);
