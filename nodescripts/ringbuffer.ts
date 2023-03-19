// Ring(Circular)
//
// A ring buffer is a type of cicular list that has a head
// and a tail.
import { strict as assert } from "node:assert";

let log = console.log;

interface head {
  position: number;
  node: MyNode<number>;
}
class MyNode<T> {
  value: number;
  next?: MyNode<number>;
  prev?: MyNode<number>;
  constructor(value) {
    this.value = value;
  }
}

class RingBuffer {
  #capacity: number;
  #length: number = 0;
  head: head = { node: null, position: 0 };
  #tail: head = { node: null, position: 0 };
  name: string = "a brand new node";
  constructor(len) {
    this.#capacity = len;
  }

  traverse(): void {
    let currentNode = this.#tail.node;
    let count = 0;
    console.log(`current node ${count}:`, currentNode);
    while (currentNode.next) {
      console.log("CURRENT NODE value", currentNode.value);
      count++;
      currentNode = currentNode.next;
    }
    console.log("END OF NODES", "\n", "Number of Nodes:", count);
  }
  get length() {
    return this.head.position - this.#tail.position;
  }

  /**
   * @param {number} val a number to find in the list
   */

  find(val) {
    let exists: boolean = false;
    let count: number = 0;
    let node = this.#tail.node;
    do {
      if (val === node.value) {
        exists = true;
        break;
      } else {
        node = node.next;
        count++;
      }
    } while (node?.next);

    return [exists, count];
  }

  deque() {
    let dequeuedNode = this.#tail.node;
    this.#tail.node = this.#tail.node.next;
    this.#tail.position++;
    return dequeuedNode.value;
  }
  /**
   * A number to provide the value for a new node to add
   * @param {number} val A value to initiate a new node
   */
  enqueue(val: number): void {
    let newNode = new MyNode(val);
    if (this.length === 0) {
      console.log("Length 0 invoked...");
      this.head.node = newNode;
      this.#tail.node = newNode;
      this.head.position++;
      return;
    }

    let tempNode = this.head.node;
    this.head.node = newNode;
    tempNode.next = newNode;
    newNode.prev = tempNode;

    console.log("LATEST NODE", this.head.node);
    this.head.position++;
  }
}

let myBuffer = new RingBuffer(3);
assert(1 + 1 === 2, "this should true");

let newQueue = new RingBuffer(10);
log("New Node", JSON.stringify(newQueue));

log("length", newQueue.length);

newQueue.enqueue(32);

log("length", newQueue.length);

newQueue.enqueue(45);

log("length", newQueue.length);

newQueue.enqueue(34);

log("length", newQueue.length);

log("TRAVERSE", newQueue.traverse());

newQueue.enqueue(2234);

log("TRAVERSE", newQueue.traverse());

newQueue.deque();

log("TRAVERSE", newQueue.traverse());
