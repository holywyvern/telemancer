# telemancer
w-gaming Jam 2019

## Engine

Made with [love](https://love2d.org/)

## Playing and building

To build de game, with all contents inside the "game" folder, just grab all files and put them inside a zip file, then rename the file game.love

Love recognizes .love files and plays them fine.

You can just do `love path/where/game/is` to run it locally for fast development.

## Executable distributions

You can append the .love file to the love executable, because zip headers are at the end, and binary files have a header at the top, it works like a charm!

## Documentation

GDD is [here](https://docs.google.com/document/d/1npqmgQECE7_RG5HE7KtymN_MsfhiOCtO6AVrZNtExVA/edit?usp=sharing)

## Some gotchas of lua

### Be careful of gloval variables

All variables are global by default, even on method definition, if the variable was not previously declared, it's value is `nil`

```lua
local function changeX()
  x = 'hello'
end

print(x) -- Prints nothing, it's `nil`

changeX()

print(x) -- Will print "hello"
```

So remember, add local on variables when using them:

```lua
local function changeX()
  local x = 'hello'
end

print(x) -- Prints nothing, it's `nil`

changeX()

print(x) -- Will print nothing again
```

### Why is 0 true?

Lua handles every type, except `nil` and `false` as `true`, even `0` `""` or `{}`

### Do I have arrays ?

Yes and no.

Tables behave like arrays, so if you want something like `[1, 2, 3]` you can easily use a lua table:

```lua
{1, 2, 3}
```

However, there are some gotchas:

- The first index is `1` not `0` so indexes are from `1..length`.
- It doesn't have any method by default, so no `:push()`.
- The length of the array is an special opperator `#array`.
- The cannot handle `nil` as a value, if you want a falsy array use `false`.

The last one seems confusing, but let me show you what I mean:

```lua
local array = {1, 2, nil, 4}

print(#array) -- Length is 2, it's the length since 1 upto a non nil value.

array = {1, 2, false, 4}

print(#array) -- This is still 4.
```

You have some nice methods for tables, located at the [table](https://www.lua.org/manual/5.1/manual.html#5.5) module.

### Do I have Hash (dictionaries) or objects here.

Yes, tables also work like hashes or objects:

```lua
local obj = { x = 2 }

print(obj.x) -- Will print '2'
print(obj['x']) -- Same thing, will print '2'
```

They look almost like javascript objects, yes. Teir definition is also really like:

```lua
local obj = { x = 2 }

local obj2 = { [ 2 * 3] = 2 } -- Using [x]

print(obj == obj) -- true
print(obj == obj2) -- false

obj2 = { x = 2 }

print(obj == obj2) -- false, but there is a catch with metaprogramming and it can be done!

obj2 = { ['x'] = 2 } -- You can define tables as such, but, why? the other one is easier
```

There are, again, some catches:

- You can't have `nil` as a key, but you can have `false`.
- If you set a value to `nil` it will be deleted from the table, you can set `false` as value.


### How is a for loop here?

A for loop looks complicated, but it's really simple:

```lua
for variable1, variable2, ... in expression do
  -- For loop
end
```

expression should return an [iterator](https://www.lua.org/manual/5.1/manual.html#2.4.5)

There are two standard iterators:

`ipairs(table)` which iterates only on all numerical indexes (`1..#array`) and `pairs(table)` which iterates over **EVERY** value, numerical and non numerical.

Be aware, it doesn't iterate over `nil` values (they don't exist for the table's concern), but it does over `false` ones.

Both standard iterators return both key and value, so the typical code is:

```lua
-- For each pair
for key, value in pairs(table) do
end

-- For each key
for key in pairs(table) do
end

-- For each value
for _, value in pairs(table) do
end
```

You can of course, define your own iterators, se the iterator section if you want more.

### Why sometimes it's obj.x and sometimes it's obj:x() ?

Lua doesn't have methods, it just have tables with function attributes.

However, lua considers self as a special keyword.

When you call a method by using : it is the same as the following sentence:

```lua
player:move('up')
```

```lua
player.move(player, 'up')
```

### How do you actually define functions ?

You may came across four different styles of declaring a function, let's take a quick look on each one to find the differences.

#### Global functions

```lua
function name()
end
```

This is the first one, rarely used, but it's to create a GLOBAL function.
(In lua, every variable is global by default, yes, it's a problem and people are not "porud" of this).

This makes the function to be accessible on any package so don't use this.

#### Local functions

```lua
local function name()
end
```

This functions works to make functions locally available to the package they are.
This is the "by default" way one usually defines functions.

#### Table properties

```lua
function obj.function(...)
end
```

This allows to define a function inside any table, it's the same as doing:

```lua
obj.function = function (...)
end
```

This is one of the best ways to define a function.

#### Method

```lua
function obj:method(...)
end
```

While lua doesn't have methods, it has a nice way to simulate code, using `:`, as mentionen above, this definition is exactly the same as doing:

```lua
obj.method = function(self, ...)
end
```

Notice than self is added, which is how lua likes to name the `this` argument.

As always, some gotchas:

- If you pass less arguments to a function it will still work, but it's arguments will be nil:

```lua
function aFunction(x, y)
  print(y)
end

aFunction()     -- does not print anything
aFunction(1)    -- does not print anything
aFunction(1, 2) -- prints '2'
```

- It won't complain if you give more arguments

```lua
function aFunction()
  print('hello')
end

aFunction()     -- works
aFunction(1)    -- works
aFunction(1, 2) -- works
```

- You can make dynamic arguments using `...`

```lua
function aFunction(...)
  args = {...} -- But you need to put them like this if you want a table of arguments.
end
```

- If you call a function inside another call, and the last variable returns multiple values, it will pass all of them:

```lua
function a(x, y, z)
  print(x, y, z)
end

function b()
  return 2, 3
end

a(1, b()) -- Prints '1 2 3'

a(b(), 1) -- Prints '2 1'

a(b(), b()) -- Prints '2 2 3'
```

You can use `()` to use only a single argument:

```rb
a(b(), (b())) -- Prints '2 2'
```

All loop conditions only check for the first return value, so:

```lua
local function func()
  return true, false
end

while func() do
  -- Infinite loop
end
```

- Returns are not implicit like ruby, so if you want to always return, you require to put the keyword.

- A function in reality returns an infinite number of values, all values not returned by the keyword are nil for all intents and purposes

```lua
local function func()
  return 1
end

local x, y, z = func() -- only x has value, all the others are `nil`
```
 
### Let's go META

Seriusly, now it's the final part of the lightning fast lua tutorial for programmers :tm:.

You can set [metatables](https://www.lua.org/manual/5.1/manual.html#2.8) to other tables.

A metatable is easy, it's just a way to extend our tables, and treat them more like objects, or classes or *ANYTHING*.

The easier and most common way it's to make something like inheritance:

```lua
local child = setmetatable({}, { __index = parent })
```

Let's exlain a bit:

setmetatable takes two arguments, the first one being a table in which do you want to extend, the second is the metatable you are going to put to it. It returns the first table we give, so we don't need to declare it in another variable.

But it will still work if you do it like this:

```lua
local child = {}

setmetatable({}, { __index = parent })
```

A metatable has special "properties" `__index` is just one of them.

It can be one of two options, it can be another table.

Which if it is, it behaves like this when one tries to get a value from it:

- Search for this table's property:
  - if exists, return the value
  - if not, look the value in the __index table.

It can be a function, receiving two arguments:

The first one being the current table, the second one is the property trying to access.
So you can return dynamic or on the fly values.
Be careful, if a value already exists in the table, it won't call your function.

You can learn more, how to do operator overloading and many cool things looking at the [reference](https://www.lua.org/manual/5.1/manual.html#2.8).

### Require gotchas

- You can write the file path as `'script/x/y/z.lua'` but usually, lua prefers this way of loading:

```lua
require "path.to.module"
```

Oh, BTW, require is not a keyword, it's a function, lua allows to skip `()` when a function takes a single argument and it's argument is a string or a table.

- Circular dependencies break everything, you can use require inside functions if needed.

### Docs

- [Reference Manual](https://www.lua.org/manual/5.1/manual.html) ([It's also in spanish](https://www.lua.org/manual/5.1/es/manual.html))

- [A nice tutorial](https://www.tutorialspoint.com/lua/)

### Strings

Strings have the concatenation operator `..`  and there is no interpolation.
One could add a format, and unlike tables, strings actually has as a metatable the [string](https://www.lua.org/manual/5.1/manual.html#5.4) as an index.

## Project structure

- /game
  - /audio
    - /se - All sound effects
    - /bgm - All music
  - /config
    - camera.lua - configuration for the game camera.
    - controls.lua - controls used by the player.
    - engine.lua - game screen size and other misc. config.
  - /data
    - /events
      - :map_id.lua - events used by the map, if no events return an empty array.
    - /maps
      - :map_name.lua - Used by the engine to load the map you can get one from any map, when you export it.
      - :map_name.tmx - Used by tiled, this is the source of the map.
    - /tilesets - All tilesets used by the game, for tiled metadata.
    - /game
      - /commands - Prototype for event commands used by the interpreter.
      - interpreter.lua - handles dynamic commands send by events when interacting.
      - map.lua - handles the current map, player and events.
      - player.lua - handles the player character.
      - setup.lua - Handles the initial player configuration.
    - /images
      - /characters - All character sprites
        - /doors - All existing doors
        - /system - Misc images, title should go here.
        - /tilesets - Tileset images used by the game.
        - /transitions - Images used by transitions.
    - /lib - Third party libraries
    - /managers
      - audio.lua - Handles game audio, pretty easily.
      - game.lua - Handles the game state It is stored on the save file.
      - save.lua - handles save files.
      - scene.lua - Handles scenes, scenes are states a game could be, title, map, menu, etc.
    - /prototypes - Handles prototypes, used for extend another objects
      - /events - Contains event types
      - /transitions - Contains transition types
    - /scenes - Contains all scenes used by the game
  - conf.lua - Has love2d's configuration before running the game. (called before the window is created)
  - main.lua - Game's entry point (called when the window is created)
