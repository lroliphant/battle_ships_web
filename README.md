BattleShips MVP Sequence
======================

![mvp sequence](https://pbs.twimg.com/media/ByjAazeCEAMKg0Q.png)

Version ‘Skateboard’:
------------

```sh
Board
  reports missed hit when no ship at position
  can have a ship
  can receive a hit on a ship

Ship
  has a position when created
```

```ruby
2.1.5 :014 > ship1 = Ship.new 'C2'
 => #<Ship:0x007ff8d21eb360 @position="C2"> 
2.1.5 :015 > ship2 = Ship.new 'D4'
 => #<Ship:0x007ff8d21f3470 @position="D4"> 
2.1.5 :016 > ship3 = Ship.new 'E5'
 => #<Ship:0x007ff8d2203578 @position="E5"> 

2.1.5 :021 > board = Board.new
 => #<Board:0x007ff8d221b808 @ships=[]> 
2.1.5 :022 > board.place ship1
 => [#<Ship:0x007ff8d21eb360 @position="C2">] 
2.1.5 :023 > board.place ship2
2.1.5 :025 > board.place ship3
 => [#<Ship:0x007ff8d21eb360 @position="C2">, #<Ship:0x007ff8d21f3470 @position="D4">, #<Ship:0x007ff8d2203578 @position="E5">] 
```

Version ‘Scooter’:
------------


```sh
Board
  reports missed hit when no ship at position
  can have a ship
  can receive a hit on a ship
  can report if all ships are sunk
  can report if not all ships are sunk

Player
  can lose
  can place ships
  can tell us when a ship is hit
  can report hit positions
  can report miss positions
  will lose if all ships are hit

Ship
  has a position when created
  can be hit
  will record number of hits
  can be missed
  will not be hit when it is missed
  is not sunk initially
  can be sunk
```

```ruby
2.1.5 :001 > p = Player.new
 => #<Player:0x007fad5ba0d678 @board=#<Board:0x007fad5ba0d650 @ships=[]>, @hits=[], @misses=[]> 
2.1.5 :002 > p.place Ship,'B1',:N
 => [#<Ship:0x007fad5bb645f8 @direction=:N, @position="B1", @size=1, @hits=0>] 
2.1.5 :003 > p.place Ship,'D9',:E
 => [#<Ship:0x007fad5bb645f8 @direction=:N, @position="B1", @size=1, @hits=0>, #<Ship:0x007fad5bb57b50 @direction=:E, @position="D9", @size=1, @hits=0>] 
2.1.5 :004 > p.place Ship,'C4',:W
 => [#<Ship:0x007fad5bb645f8 @direction=:N, @position="B1", @size=1, @hits=0>, #<Ship:0x007fad5bb57b50 @direction=:E, @position="D9", @size=1, @hits=0>, #<Ship:0x007fad5bb4ef00 @direction=:W, @position="C4", @size=1, @hits=0>]                
2.1.5 :005 > p.receive_hit 'B9'
 => :miss 
2.1.5 :006 > p.receive_hit 'C4'
 => :hit 
2.1.5 :007 > p.lost?
 => false 
2.1.5 :008 > p.receive_hit 'D9'
 => :hit 
2.1.5 :009 > p.receive_hit 'B1'
 => :hit 
2.1.5 :010 > p.lost?
 => true 
```

Version ’Bike’:
-----------

```sh
Board
  reports missed hit when no ship at position
  can have a ship
  does not allow ships to overlap
  can receive a hit on a ship
  can receive a hit on a sub
  can report if all ships are sunk
  can report if not all ships are sunk

Player
  can lose
  can place ships
  can tell us when a ship is hit
  can report hit positions
  can report miss positions
  will lose if all ships are hit

Ship
  has a position when created
  can be hit
  will record number of hits
  can be missed
  will not be hit when it is missed
  is not sunk initially
  can be sunk

Submarine
  has size 2
  knows all positions when facing north
  knows all positions when facing east
  knows all positions when facing south
  knows all positions when facing west
  gets hit in any of the positions it is in
```

```ruby
2.1.5 :002 > sub = Submarine.new 'C4',:N
 => #<Submarine:0x007ff1fc2de038 @direction=:N, @position="C4", @start_position="C4", @size=2, @hits=0> 
2.1.5 :003 > board = Board.new
 => #<Board:0x007ff1fc2d4c68 @ships=[]> 
2.1.5 :004 > board.place sub
 => [#<Submarine:0x007ff1fc2de038 @direction=:N, @position="C4", @start_position="C4", @size=2, @hits=0>] 
2.1.5 :005 > board.receive_hit 'H1'
 => :miss 
2.1.5 :006 > board.receive_hit 'D5'
 => :miss 
2.1.5 :007 > board.receive_hit 'C3'
 => :hit 
2.1.5 :008 > board.receive_hit 'C4'
 => :hit 
2.1.5 :009 > sub
 => #<Submarine:0x007ff1fc2de038 @direction=:N, @position="C4", @start_position="C4", @size=2, @hits=2> 
2.1.5 :010 > board.all_sunk?
```


Version ‘Motorbike’:
-------------

```sh
Board
  reports missed hit when no ship at position
  can have a ship
  does not allow ships to overlap
  does not allow ships outside the board
  can receive a hit on a ship
  can receive a hit on a sub
  can report if all ships are sunk
  can report if not all ships are sunk

Destroyer
  has size 3
  knows all positions when facing north
  knows all positions when facing east
  knows all positions when facing south
  knows all positions when facing west
  gets hit in any of the positions it is in

Player
  can lose
  can place ships
  can tell us when a ship is hit
  can report hit positions
  can report miss positions
  will lose if all ships are hit

Ship
  has a position when created
  can be hit
  will record number of hits
  can be missed
  will not be hit when it is missed
  is not sunk initially
  can be sunk

Submarine
  has size 2
  knows all positions when facing north
  knows all positions when facing east
  knows all positions when facing south
  knows all positions when facing west
  gets hit in any of the positions it is in
 ```

```ruby
2.1.5 :002 > p = Player.new
 => #<Player:0x007fa3a200dfa0 @board=#<Board:0x007fa3a200df78 @ships=[]>, @hits=[], @misses=[]> 
2.1.5 :004 > p.place Destroyer, 'F5', :S
 => [#<Destroyer:0x007fa3a11794f8 @direction=:S, @position="F5", @start_position="F5", @size=3, @hits=0>] 
2.1.5 :005 > p.lost?
 => false 
2.1.5 :006 > p.receive_hit 'F5'
 => :hit 
2.1.5 :007 > p.lost?
 => false 
2.1.5 :008 > p.receive_hit 'F6'
 => :hit 
2.1.5 :009 > p.receive_hit 'F7'
 => :hit 
2.1.5 :010 > p.lost?
 => true 
```

Note there is lots of room for refactoring here ...

Version ‘Car’:
--------------

Coming soon!