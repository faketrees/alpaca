#https://imgur.com/gallery/iwTNP different sort methods visualized
#https://www.bigocheatsheet.com/


def bubble(arr)
    count = 0
    sorted = false

    while !sorted
        sorted = true

        (0...(arr.length-1)).each_with_index do |el, i|
            if arr[i] > arr[i+1]
                arr[i], arr[i +1] = arr[i +1], arr[i]
                sorted = false
                count += 1
            end
        end
    end

 [arr, count]
end



numbers = [2, 5, 6, 8, 4, 3, 10, 32, 5, 9]

p bubble(numbers)