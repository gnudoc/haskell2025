doubleMe x = x + x
doubleUs x y = doubleMe (x + y)

quadrupleSmallNumber x = doubleMe (if x > 100 then x else doubleMe x)
-- ^ if statements MUST have else
-- if statements are expressions like any other

conanO'Brien = "Hi! I'm Conan!"
-- ^ function names start with lowercase
-- they can contain '
-- a function with no parameters is a "name" or "definition"
-- functions are immutable


---------
--LISTS--
---------

-- lists are homogenous - all the same type of items
primes = [2,3,5,7,11]

-- strings are lists of characters
-- list concatenation is ++
-- it requires walking the entire first list then appending the second list
bigList x y = x ++ y

-- prepend a single item to the start of a list w :
-- this is instantaneous
prePend a b = a:b

{- so "string" is synctatic sugar for ['s','t','r','i','n','g']
 - which is syntactic sugar for 's':'t':'r':'i':'n':'g':[]
 - (remember the empty list)
 -}

getNthItem list n = list !! n -- 0 indexed

-- in nested lists, all the items have to be the same type
-- so [[1,2,3],[4,5,6],[',']] is illegal

-- compare lists lexicographically with >, <=, == etc
maxList x y = if x >= y then x else y

-- head x and tail x of a list are as expected
-- last x is last item, init x is all but last item
-- these four give a RUNTIME error if used w empty list

-- length x returns the length of a list
-- null x returns a bool
-- reverse x reverses a list
-- take x y returns a list of the x items at the start of list y
-- drop x y returns the list without the x items at the start

-- minimum x and maximum x can be used of lists of comparable items
-- sum x returns the sum of a list of numbers
-- product x works similarly
-- x `elem` y checks if x is an element of y

-- RANGES --
-- [n..m] is the same as [n, n+1, ... ,m-1, m] for int n and int m
-- if n is a float but m is an int then we stop before m but it's still n+1, n+2 etc
-- if m is a float then it gets rounded to the nearest n + int
-- e.g [1.1..4.9] == [1.1,2.1,3.1,4.1,5.1]
-- e.g [1.1..4.5] == [1.1,2.1,3.1,4.1]
-- e.g ['A'..'d'] == "ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcd"
-- N.B. we can also specify the first two terms of an arithmetic sequence where a!=1
-- e.g [3, 7..20] == [3,7,11,15,19] and [2,4..20] for the even naturals <= 20
-- or [20,19..1] for the naturals from 20 to 1 in descending order.
-- or [0,2..] for all even numbers (but watch out for trying to evaluate this on the repl!)
-- another way to do this sort of cleverness (and much more) is list comprehension.

-- cycle will repeat a finite list infinitely
-- repeat will give an infinite listing repeating a single element
-- and replicate m n will give a list of the element n repeated m times

-- LIST COMPREHENSION --
evensUnder20 = [x*2 | x <- [1..10]] -- vaguely reminiscent of java lambda syntax...
evensUnder20DivisibleBy5 = [x*2 | x <- [1..10], x*2 `mod` 5 == 0]
anotherOne = [x | x <- [50..150], x `mod` 7 == 3] -- predicate is the bit after ,
-- we can have multiple predicates
-- e.g. A first attempt at sieving primes - logically incorrect
primesUnder200 = [x | x <- [2..200], odd x,
                                   x`mod`3/=0,
                                   x`mod`5/=0,
                                   x`mod`7/=0,
                                   x`mod`11/=0,
                                   x`mod`13/=0]
-- not the actual fizz-buzz problem - just demonstrates using a function parameter
fizzBuzz xx = [if x `mod` 3 == 0 then "fizz" else "buzz" | x <- xx, odd x]

