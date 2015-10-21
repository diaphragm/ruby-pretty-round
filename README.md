ruby-pretty-round
================
This gem add useful numerical rounding methods to `Numeric` class as shown below...
- round to nearest multiple
- round with significant digits

Install
================
`$ gem install pretty_round`

Usage
================
```rb
require "pretty_round"

x = 123.456

# round with precision
x.round(2) #=> 123.46 (ruby built-in)
x.roundup(2) #=> 123.46
x.rounddown(2) #=> 123.45

# round to nearest multiple
x.mroundup(10) #=> 130
x.mrounddown(0.01) #=> 123.45
x.mround(50) #=> 100
x.mround(0.02) #=> 123.46

# round with significant digit
x.sround(2) #=> 120
x.sround(4) #=> 123.5
```

Rounding direction
================

`#roundup`, `#mroundup`
----------------
These methods round up to the positive infinity direction.
```rb
 1.9.mroundup(1) #=> 2
 1.1.mroundup(1) #=> 2
-1.1.mroundup(1) #=> -1
-1.9.mroundup(1) #=> -1
```

`#rounddown`, `#mrounddown`
----------------
These methods round down to the negative infinity direction.
```rb
 1.9.mrounddown(1) #=> 1
 1.1.mrounddown(1) #=> 1
-1.1.mrounddown(1) #=> -2
-1.9.mrounddown(1) #=> -2
```

`#mround`, `#sround`
----------------
These methods round off the absolute value, dos not round even.
```rb
 1.9.mround(1) #=> 2
 1.1.mround(1) #=> 1
-1.1.mround(1) #=> -1
-1.9.mround(1) #=> -2
```

----
Also, try to run `examples/example.rb`


