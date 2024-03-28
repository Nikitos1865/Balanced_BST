require './bst_node'
require '../recursion'


class BST
    def initialize(array)
        @root = to_balanced_tree(merge_sort(array.uniq))
    end 

    def to_balanced_tree(array)
        mid = array.length/2.0
        if array.length <= 1
            return 
        else 
            boot = BST_Node.new(array[mid])
            boot.left = to_balanced_tree(array[..array.length/2.0-1])
            boot.right = to_balanced_tree(array[1+array.length/2.0..])
            return boot
        end  
    end 

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
      end

end 



bst = BST.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

bst.pretty_print