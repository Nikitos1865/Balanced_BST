require './bst_node'
require '../recursion'


class BST
    def initialize(array)
        @root = to_balanced_tree(merge_sort(array.uniq))
    end 

    def to_balanced_tree(array)
        if array.length < 1
            return 
        elsif array.length == 1
            boot = BST_Node.new(array[0])
        else 
            mid = array.length/2.0
            boot = BST_Node.new(array[mid])
            boot.left = to_balanced_tree(array[..mid-1])
            boot.right = to_balanced_tree(array[1+mid..])
            return boot
        end  
    end 

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
      end

end 

p array = merge_sort([1, 7, 4, 23, 8, 9, 4, 6, 3, 5, 7, 9, 67, 6345, 324].uniq)

bst = BST.new([1, 7, 4, 23, 8, 9, 4, 6, 3, 5, 7, 9, 67, 6345, 324])

p 

bst

bst.pretty_print


