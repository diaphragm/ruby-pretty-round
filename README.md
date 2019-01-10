ruby-pretty-round
================
This gem add useful numerical rounding methods to `Numeric` class as shown below.
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
x.roundup #=> 124
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

Refinements
----------------
When `require 'pretty_round'`, rounding methods are included in **global scope**.
To include in limited scope, please load `pretty_round/core` and use refinements.
```rb
require 'pretty_round/core'
using PrettyRound
```

Rounding direction
================
- `#*ceil` / `#*floor`: These methods round to the positive / negative infinity direction. Its behavior is same as built-in `#ceil`, `#floor`.
- `#*roundup` / `#*rounddown`: These methods round to far from / near to 0 direction.
- `#*round`: These methods round off the absolute value, does not round even. Its behavior is same as built-in `#round`.
- `#*truncate`: These methods are alias of `#*rounddown`.

Result table is shown below, including ruby built-in rounding methods for comparison.
An axis of abscissas refers to the receiver and an axis of ordinates refers to the methods.
```
              |  1.9  1.1 -1.1 -1.9
-----------------------------------
.ceil         |    2    2   -1   -1 (ruby built-in)
.floor        |    1    1   -2   -2 (ruby built-in)
.roundup      |    2    2   -2   -2
.rounddown    |    1    1   -1   -1
.round        |    2    1   -1   -2 (ruby built-in)
.truncate     |    1    1   -1   -1 (ruby built-in)
.mceil(1)     |    2    2   -1   -1
.mfloor(1)    |    1    1   -2   -2
.mroundup(1)  |    2    2   -2   -2
.mrounddown(1)|    1    1   -1   -1
.mround(1)    |    2    1   -1   -2
.mtruncate(1) |    1    1   -1   -1
.sceil(1)     |    2    2   -1   -1
.sfloor(1)    |    1    1   -2   -2
.sroundup(1)  |    2    2   -2   -2
.srounddown(1)|    1    1   -1   -1
.sround(1)    |    2    1   -1   -2
.struncate(1) |    1    1   -1   -1
```

Also, try to run `examples/example.rb`


Known Bugs
================
Float presision
----------------
```rb
1.2.mrounddown(0.1) #=> 1.1
```
Oops... Resulting 1.2 is expected.

Becouse,
```rb
1.2.divmod(0.1) #=> [11, 0.0999999999999999]
```

To avoid this bug, please use `Rational`.
```rb
1.2r.mrounddown(0.1r) #=> (6/5)
```
