require'./lib/bst'

bst = BST.new(Array.new(15) {rand(1..100)})

bst.pretty_print

bst.preorder {|val| p val.data}
puts "\n"
bst.inorder {|val| p val.data}
puts "\n"
bst.postorder {|val| p val.data}

p bst.balanced?

bst.insert(101)
bst.insert(102)
bst.insert(103)
bst.insert(104)
bst.insert(105)
bst.insert(106)

bst.pretty_print

p bst.balanced?

bst.balance

p bst.pretty_print
p bst.balanced?



