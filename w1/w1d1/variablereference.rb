#.dup makes a copy but points to a different point in memory
#arr1 = [1,2,3]
#arr2 = arr1 would be the same place in memory so any changes I make to arr1 affect arr2
#arr2 = arr1.dup has two seperate points in memory 
#object_id calls the memory id number
#._id2ref calls the variable from the memory number
#blocks of code access new memory

#tic-Tac-toe
grid = Array.new(3) {Array.new(3)} # do this, this executes
bad_grid = Array.new(3, Array.new) #don't do this, this points all of the arrays to the same point in memory

grid[0][1] = "x"    #[O X O]
grid[0][0] = "o"    #[nil, nil, nil]
grid[0][2] = "o"    #[nil, nil, nil]

print grid[0][0].object_id
puts
puts "-" * 40
puts
print grid[0][1].object_id
puts
puts "-" * 40
puts
print grid[0][2].object_id
puts
puts "-" * 40
puts
print grid[0].object_id