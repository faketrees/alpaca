  x = 15
  def foo(x)
    x = 10
  end
  foo(x)
  p x


    x = []
  def foo(x)
    x << "Fancy Feast"
  end
  foo(x)
  p x



arr = Array.new(3) { [] }
  arr[0] << "Foo"
p arr