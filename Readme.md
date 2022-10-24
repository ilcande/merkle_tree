## Installation

Clone the repo on you machine then

```
cd merkle-tree
```
and execute 
```
bundle
```

## Usage
Create a new MerkleTree by passing all the messages to be hashed:

```
merkle_tree = MerkleTree.new("L1", "L2", "L3", "L4")
```

or 
```
MerkleTree.createMerkleTree(["L1", "L2", "L3", "L4"])

```

To access the root node of the merkle tree use the `root` method that will return the tree structure with all its children and their signatures.

For example, given a tree with 4 messages
```
merkle_tree = MerkleTree.new("L1", "L2", "L3", "L4")
```


```
merkle_tree.root
# =>
#<MerkleTree::Node:0x0000000100880238 @left=#<MerkleTree::Node:0x0000000100880d28 @left=#<MerkleTree::Node:0x0000000100881368 @left=nil, @right=nil, @value="L1">, @right=#<MerkleTree::Node:0x0000000100881318 @left=nil, @right=nil, @value="L2">, @value="b015e3305cf092ee607e7d3468d3c15bef72cd85">, @right=#<MerkleTree::Node:0x0000000100880918 @left=#<MerkleTree::Node:0x00000001008812f0 @left=nil, @right=nil, @value="L3">, @right=#<MerkleTree::Node:0x00000001008812c8 @left=nil, @right=nil, @value="L4">, @value="85e47efdebb63df0115e79c2cff33042853d1607">, @value="c95c74ac8566d2a67ddeaee5e991d635f6bf6b34">
```

You can also check the tree height:

```
merkle_tree.height # => 2
```

and also return an array containing the hashes of the given level

```
merkle_root.level(0)
```