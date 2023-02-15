const express = require("express");

const app = express();

let memoValues = new Map();

app.get("/", (req, res) => {
  res.json({ one: 1, two: 2, three: 3 });
});

app.get("/finbonacci", (req, res) => {
  const startTime = new Date();
  const result = finbonacci(parseInt(req.query.number));
  const endTime = new Date();

  res.json({
    number: parseInt(req.query.number),
    finbonacci: result,
    time: endTime.getTime() - startTime.getTime() + "ms",
  });
});

const finbonacci = (n) => {
  if (memoValues.has(n)) {
    return memoValues.get(n);
  }

  if (n <= 1) {
    return 1;
  }
  let answer = finbonacci(n - 1) + finbonacci(n - 2);
  memoValues.set(n, answer);
  return answer;
};

app.listen(3000, () => console.log("listening on port 3000"));
