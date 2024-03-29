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
            find(root.left, key)
        else 
            find(root.right, key)
        end 
    end 

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

    def level_order(root)
        if root == nil
            return 
        end 
        queue = []
        queue << root
        while !queue.empty? 
            yield(queue[0])
            root = queue.shift
            if root.left != nil
                queue << root.left
            end 
            if root.right != nil
                queue << root.right
            end 
        end 
    end 

    def height(root)
        if root == nil 
            return 0
        else 
            hleft = height(root.left)
            hright = height(root.right)

            if hleft > hright
                return hleft += 1
            else 
                return hright += 1
            end 
        end 
    end 

    def depth(root, node) 
        if root == nil
            return -1
        end 

        dist = -1
        
        if ((root.data == node.data) || (dist = depth(root.left, node)) >= 0 || (dist = depth(root.right, node)) >= 0)
            return dist+=1
        end

        return dist
    end 


end 

p array = merge_sort([1, 7, 4, 23, 8, 9, 4, 6, 3, 5, 7, 9, 67, 6345, 324].uniq)

bst = BST.new([1, 7, 4, 23, 8, 9, 4, 6, 3, 5, 7, 9,10, 11, 14, 67, 6345, 324, 24, 25, 26, 28])

bst.pretty_print


#bst.level_order(bst.root) {|value| p value.data}

#p bst.height(bst.root)

p bst.depth(bst.root, bst.find(bst.root,5))
 







