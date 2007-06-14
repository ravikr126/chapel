/*
 * This test constructs a binary tree in parallel and assigns a unique
 * id to each node.  It then computes the sum of the id's in parallel.
 *
 */


//
// configuration constant indicating the height of the tree to
// construct.  Override using --treeHeight=<height>.
//
config const treeHeight: uint = 4;


//
// a simple binary tree node class
//
class node {
  var id: int;
  var left, right: node;
}


//
// the main routine builds the tree and then sums its values
//
def main() {
  var root = buildTree();
  writeln("sum=", sum(root));
}

//
// buildTree() is a recursive routine that uses a cobegin to create a
// node's children in parallel.  It uses the monotonically decreasing
// height variable to control the recursion.
//
def buildTree(height: uint = treeHeight, id: int = 1): node {
  var newNode = node(id);

  if height > 1 {
    cobegin {
      newNode.left  = buildTree(height-1, id + 1);
      newNode.right = buildTree(height-1, id + (1 << (height-1)));
    }
  }

  return newNode;
}


//
// sum() walks the tree in parallel using a cobegin, computing the sum
// of the node IDs using a postorder traversal.
//
def sum(n: node): int {
  var total = n.id;

  if n.left != nil {
    var sumLeft, sumRight: int;
    cobegin {
      sumLeft = sum(n.left);
      sumRight = sum(n.right);
    }
    total += (sumLeft + sumRight);
  }
  return total;
}


