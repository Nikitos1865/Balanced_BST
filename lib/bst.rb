require './bst_node'
require '../recursion'


class BST

    attr_accessor :root 

    def initialize(array)
        @root = to_balanced_tree(merge_sort(array.uniq))
    end 

    def to_balanced_tree(array)
        if array == nil || array.length < 1 
            return nil
        elsif array.one?
            root = BST_Node.new(array[0])
        else 
            mid = array.length/2.0
            root = BST_Node.new(array[mid])
            root.left = to_balanced_tree(array[..mid-1])
            root.right = to_balanced_tree(array[1+mid..])
            return root
        end  
    end 

    def insert(root, key)
        if root == nil 
            root = BST_Node.new(key)
        else 
            if root.data == key
                root 
            elsif key < root.data  
                root.left = insert(root.left,key)
            else 
                root.right = insert(root.right,key)
            end 
        end 
        root 
    end 

    def find(root,key)
        if root == nil 
            return nil
        elsif root.data == key
            return root
        elsif key < root.data
            puts "left"
            find(root.left, key)
        else 
            puts "right "
            find(root.right, key)
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

c = [5]

bst1 = BST.new([])

p bst.find(bst.root, 6345)





bst.pretty_print





