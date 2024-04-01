require_relative'./bst_node'
require_relative'../recursion'


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

    def insert(key, node = self.root)
        p node
        #p key
        if node == nil 
            node = BST_Node.new(key)
        else 
            if key == node.data
                node 
            elsif key < node.data  
                node.left = insert(key, node.left)
            else 
                node.right = insert(key, node.right)
            end 
        end 
        node 
    end 

    def find(key, root = self.root)
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

    def level_order(root = self.root)
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

    def inorder(root = self.root, &block) 
        if root != nil
        inorder(root.left, &block)
        yield(root)
        inorder(root.right, &block)
        end
    end 

    def preorder(root = self.root, &block) 
        if root != nil 
        yield(root)
        preorder(root.left, &block)
        preorder(root.right, &block)
        end
    end 

    def postorder(root = self.root, &block) 
        if root != nil 
        postorder(root.left, &block)
        postorder(root.right, &block)
        yield(root)
        end
    end 

    def height(root = self.root)
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

    def balanced?(root = self.root)
        if root.nil?
            return true 
        end 

        lh = height(root.left)
        rh = height(root.right)

        if ((lh - rh).abs <= 1) && balanced?(root.left) && balanced?(root.right)
            return true 
        end

        return false
    end 

    def delete(value, node = root)
        return node if node.nil?
    
        if value < node.data
          node.left = delete(value, node.left)
        elsif value > node.data
          node.right = delete(value, node.right)
        else
          # if node has one or no child
          return node.right if node.left.nil?
          return node.left if node.right.nil?
    
          # if node has two children
          leftmost_node = leftmost_leaf(node.right)
          node.data = leftmost_node.data
          node.right = delete(leftmost_node.data, node.right)
        end
        node
      end

      def leftmost_leaf(node)
        node = node.left until node.left.nil?
    
        node
      end

      def balance(root = self.root)
        arr = []
        inorder(root) {|node| arr << node.data}
        self.root = to_balanced_tree(arr)
      end 





end 











