/*: Tree Introduction
 # Tree
 ### Organize hierarchical structures 🌳
 
 Trees are make up of nodes. Use trees to:
 
 1. Represent hierarchical relationships
 2. Manage sorted data
 3. Enable fast lookup operations
 
 ### About Nodes
 Every node except for the root node is connected to exactly one node above it.\
 The node on top is a **parent node** and nodes directly connected to that parent from below are its **child nodes**.\
 Parents may have more than one child.\
 A node that has no children is a leaf. 🍃
 
 ```
       ⚪️ → root node
      /   \
    ⚪️     ⚪️
   /  \   /  \
 ⚪️   ⚪️ ⚪️  ⚪️ → leaf nodes
 ```

 
# Types of Tree Traversal
 > Iterate through a tree = Tree Traversal
 
 **Depth First Traversal**\
 Starts at the root node and traverses all the way down to one branch and exhausts that branch before backtracking.
 
 ```
       🟢
      /   \
    🟢     ⚪️
   /  \   /  \
 🟢   ⚪️ ⚪️  ⚪️
 ```

 
 **Level Order Traversal**\
 Starts at the root but then visits all the nodes at each level, before dropping down to the next level.
 
 ```
       🟢
      /   \
    🟢     🟢
   /  \   /  \
 ⚪️   ⚪️ ⚪️  ⚪️
 ```

 */

