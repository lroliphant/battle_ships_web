

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




Version ’Bike’:





Version ‘Motorbike’:





Version ‘Car’: