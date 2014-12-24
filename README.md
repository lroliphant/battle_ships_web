

Version ‘Skateboard’:
—————

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
———————————


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







Version ‘Motorbike’:
-------------





Version ‘Car’:
--------------