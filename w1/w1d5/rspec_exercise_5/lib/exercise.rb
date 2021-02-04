




def maximum(arr, &blk)
 return nil if arr.length == 0
    thing = blk.call(arr[0])
    saved = arr[0]
    
    arr.each_with_index do |el, i|
        if blk.call(el) >= thing
            thing = blk.call(el)
            saved = arr[i]
        end
    end
    saved
end









def max_tie_breaker(arr, prc, &blk)
 return nil if arr.length == 0
    thing = blk.call(arr[0])
    saved = arr[0]
    
    arr.each_with_index do |el, i|
        if blk.call(el) > thing
            thing = blk.call(el)
            saved = arr[i]
        elsif blk.call(el) == thing
            if prc.call(el) > prc.call(saved)
                saved = arr[i]
            elsif prc.call(el) == prc.call(saved)
                saved == arr[i]
            else
            end
        end
    end
    saved
end


