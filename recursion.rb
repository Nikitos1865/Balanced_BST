def fibs(num)
index = 2
    arr = [0,1]
    while index != num 
        if num == 1
            [arr[0]]
        elsif num == 2
            [arr[0], arr[1]]
        else 
            arr[index] = arr[index-2]+arr[index - 1]
        end
        index += 1
    end 
    arr
end 



def fibs_rec(num)
        if num == 1
            return [0]
        elsif num == 2
            return [0,1]
        else 
            a = fibs_rec(num-1)
            a.push(a[num-2] + a[num-3])
            a
        end 
end 

def merge_sort(array)
    if array.size >= 2
        left, right = array.each_slice((array.size/2.0).round).to_a
        
        merge_sort(left)
        merge_sort(right)

        left
        right

        merge(array,left,right)
    else 
        array
    end 
end 

def merge(array, left, right)
    i = 0
    j = 0
    k = 0 

    while (i < left.size && j < right.size)
        if left[i] <= right[j]
            array[k] = left[i]
            i += 1
        else 
            array[k] = right[j]
            j += 1
        end 
        k += 1
    end 

    while (i < left.size)
        array[k] = left[i]
        k += 1
        i += 1
    end 

    while (j < right.size)
        array[k] = right[j]
        k += 1
        j += 1
    end 
    array
end 


