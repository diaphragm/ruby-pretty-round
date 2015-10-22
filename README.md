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
x.roundup(2) #=> 123.46
x.rounddown(2) #=> 123.45

# round to nearest multiple
x.mceil(50) #=> 150
x.mfloor(25) #=> 100
x.mroundup(2) #=> 124
x.mrounddown(0.3) #=> 123.3
x.mround(9.87) #=> 128.31

# round with significant digit
x.sceil(1) #=> 200
x.sfloor(2) #=> 120
x.sroundup(3) #=> 124
x.srounddown(4) #=> 123.4
x.sround(5) #=> 123.46
```

Rounding direction
================
Also, try to run `examples/example.rb`

`#mceil`, `#sceil`
----------------
These methods round up to the positive infinity direction.
Its behavior is same as built-in #ceil.
```rb
 1.9.mceil(1) #=> 2
 1.1.mceil(1) #=> 2
-1.1.mceil(1) #=> -1
-1.9.mceil(1) #=> -1
```

`#mfloor`, `#sfloor`
----------------
These methods round down to the negative infinity direction.
Its behavior is same as built-in #floor.
```rb
 1.9.mfloor(1) #=> 1
 1.1.mfloor(1) #=> 1
-1.1.mfloor(1) #=> -2
-1.9.mfloor(1) #=> -2
```

`#roundup`, `#mroundup`, `#sroundup`
----------------
These methods round up to far from 0 direction.
```rb
 1.9.mroundup(1) #=> 2
 1.1.mroundup(1) #=> 2
-1.1.mroundup(1) #=> -2
-1.9.mroundup(1) #=> -2
```

`#rounddown`, `#mrounddown`, `#srounddown`
----------------
These methods round down to near from 0 direction.
```rb
 1.9.mrounddown(1) #=> 1
 1.1.mrounddown(1) #=> 1
-1.1.mrounddown(1) #=> -1
-1.9.mrounddown(1) #=> -1
```


`#mround`, `#sround`
----------------
These methods round off the absolute value, dos not round even.
Its behavior is same as built-in #round.
```rb
 1.9.mround(1) #=> 2
 1.1.mround(1) #=> 1
-1.1.mround(1) #=> -1
-1.9.mround(1) #=> -2
```

