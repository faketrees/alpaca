def procipher(x, y)
  x.split.map!{|z|y.keys.inject(z){|a,g|a=g.call(a) ? y[g].call(a) : a}}.join" "
end