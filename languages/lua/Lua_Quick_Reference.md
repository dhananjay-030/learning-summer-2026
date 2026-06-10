# Lua — Quick Reference Notes

---

## Setup & Running

```bash
# Install (Arch Linux)
sudo pacman -S lua

# Run a file
lua main.lua
```


---

## Output & Comments

```lua
print("Hello World")           -- prints with newline
io.write("Hello ")             -- prints WITHOUT newline

-- single line comment

--[[
  multi-line comment
]]

print("Hello " .. " World")   -- .. concatenates strings
```

---

## Data Types

| Type | Example | Notes |
|------|---------|-------|
| `nil` | `nil` | empty / no value |
| `number` | `1`, `3.14`, `-5` | integers and floats |
| `string` | `"hello"`, `'hi'` | single or double quotes |
| `boolean` | `true`, `false` | |
| `table` | `{1, 2, 3}` | arrays, dicts, objects |

**Only false values in Lua:** `false` and `nil`. Everything else (including `0`, `""`) is **truthy**.

```lua
print(type(42))       -- number
print(type("hello"))  -- string
print(type(nil))      -- nil
print(type(true))     -- boolean
```

---

## Variables & Scope

```lua
local x = 10          -- local (preferred)
y = 20                -- global (avoid)
_G.MyVar = 30         -- explicit global (recommended style for globals)
```

- `local` = accessible only in current block/file
- Global = accessible everywhere
- Lua is **case-sensitive**: `name` ≠ `Name`
- Variables can hold any type and be reassigned freely
- Set to `nil` to delete: `x = nil`

**Default parameter pattern:**
```lua
local function greet(name)
    name = name or "stranger"   -- if nil, use default
    print("Hello " .. name)
end
```

---

## Strings

```lua
local s = "Hello World"

#s                          -- length: 11
string.len(s)               -- same as #s
string.upper(s)             -- HELLO WORLD
string.lower(s)             -- hello world
string.sub(s, 1, 5)         -- Hello
string.sub(s, 7, 99)        -- World
string.rep("Hi", 3, ", ")   -- Hi, Hi, Hi
string.find(s, "World")     -- 7  11
string.match(s, "World")    -- World
string.gsub(s, "o", "!")    -- Hell! W!rld  2
string.format("%.2f", math.pi)  -- 3.14

tonumber("22")    -- converts string → number
tostring(22)      -- converts number → string
```

**Escape characters:**
```lua
"\n"  -- newline
"\t"  -- tab
"\\"  -- backslash
"\""  -- double quote
"\'"  -- single quote
```

**Multi-line string:**
```lua
local s = [[
line one
line two
]]
```

---

## Math

```lua
5 + 5     -- 10  addition
20 - 5    -- 15  subtraction
5 * 5     -- 25  multiplication
10 / 2    -- 5   division
10 % 3    -- 1   modulus (remainder)
2 ^ 5     -- 32  power

-- math library
math.pi             -- 3.14159...
math.floor(3.9)     -- 3  (always down)
math.ceil(3.1)      -- 4  (always up)
math.abs(-5)        -- 5
math.min(3, 1, 5)   -- 1
math.max(3, 1, 5)   -- 5
math.sqrt(16)       -- 4

-- random
math.randomseed(os.time())
math.random()        -- float 0–1
math.random(10)      -- int 1–10
math.random(10, 50)  -- int 10–50
```

Brackets override precedence: `(5 + 10) * 2 = 30`, `5 + 10 * 2 = 25`.

---

## If Statements

```lua
local age = 18

if age > 17 then
    print("allowed")
elseif age > 10 then
    print("almost")
else
    print("denied")
end
```

**Operators:** `>` `<` `>=` `<=` `==` `~=` (not equal — **not** `!=`)

```lua
-- and: both must be true
if age > 17 and age < 60 then ... end

-- or: at least one must be true
if age < 10 or age > 60 then ... end

-- not: inverts the value
if not age < 18 then ... end
```

**Ternary-style:**
```lua
local old = age > 30 and true or false
```

---

## Loops

```lua
-- for loop
for i = 1, 10 do print(i) end          -- 1 to 10
for i = 1, 10, 2 do print(i) end       -- 1 3 5 7 9
for i = 10, 1, -1 do print(i) end      -- 10 down to 1

-- while loop (runs while condition is true)
local n = 5
while n > 0 do
    print(n)
    n = n - 1
end

-- repeat...until (runs at least once, stops when condition becomes true)
local x = 1
repeat
    print(x)
    x = x + 1
until x > 5
```

---

## Tables (Arrays)

```lua
local arr = {10, "hello", true, 3.14}

arr[1]       -- 10      (1-indexed, not 0!)
arr[2]       -- hello
#arr         -- 4       (length)
arr[#arr]    -- last element

-- loop through
for i = 1, #arr do print(arr[i]) end

-- table functions
table.insert(arr, 2, "new")   -- insert "new" at index 2
table.remove(arr, 3)          -- remove element at index 3
table.sort(arr)               -- sort in place
table.concat(arr, ", ")       -- join into string: "10, hello, ..."
```

**Multi-dimensional:**
```lua
local matrix = {{1,2,3}, {4,5,6}, {7,8,9}}
print(matrix[2][3])   -- 6
```

---

## Functions

```lua
local function add(x, y)
    return x + y
end

print(add(3, 5))   -- 8
```

**Multiple return values:**
```lua
local function minMax(a, b)
    return a - b, a + b
end

local diff, total = minMax(10, 5)
```

**Variable arguments:**
```lua
local function sum(...)
    local args = {...}
    local total = 0
    for _, v in pairs(args) do
        total = total + v
    end
    return total
end

print(sum(1, 2, 3, 4, 5))   -- 15
```

**Recursion:**
```lua
local function factorial(n)
    if n <= 1 then return 1 end
    return n * factorial(n - 1)
end
```

**Anonymous function / closure:**
```lua
local function counter()
    local count = 0
    return function()
        count = count + 1
        return count
    end
end

local c = counter()
print(c())   -- 1
print(c())   -- 2
print(c())   -- 3
```

---

## User Input

```lua
io.write("Enter name: ")
local name = io.read()      -- always returns a string
print("Hello " .. name)

-- convert to number before comparing
local num = tonumber(io.read())
if num == 42 then print("correct") end
```

---

## File I/O

```lua
-- Write (overwrites)
local f = io.open("file.txt", "w")
f:write("Hello World")
f:close()

-- Append (adds to end)
local f = io.open("file.txt", "a")
f:write("\nNew line")
f:close()

-- Read
local f = io.open("file.txt", "r")
local content = f:read("*all")    -- entire file
-- f:read("*line")  → one line
-- f:read("*number")  → reads as number
-- f:read(5)  → reads 5 characters
f:close()
print(content)
```

Always call `f:close()`. Not closing causes memory leaks.

---

## OS Module

```lua
os.time()                         -- Unix timestamp (seconds since 1970)
os.date()                         -- current date/time string
os.difftime(os.time(), past)      -- seconds between two times
os.getenv("HOME")                 -- environment variable
os.rename("old.txt", "new.txt")   -- rename file
os.remove("file.txt")             -- delete file
os.exit()                         -- terminate program

-- timing code
local start = os.clock()
-- ... code to benchmark ...
print(os.clock() - start)         -- seconds elapsed
```

---

## Modules

**mymath.lua:**
```lua
local mymath = {}

function mymath.add(x, y)   return x + y   end
function mymath.pow(x, y)   return x ^ y   end

return mymath
```

**main.lua:**
```lua
local mod = require("mymath")
print(mod.add(5, 10))    -- 15
print(mod.pow(2, 5))     -- 32
```

---

## OOP (Simulated with Tables)

```lua
local function Pet(name)
    name = name or "Unknown"
    return {
        name   = name,
        status = "Hungry",
        feed   = function(self)
            self.status = "Full"
        end
    }
end

local cat = Pet("Kitty")
local dog = Pet()

cat:feed()               -- colon → passes self automatically
print(cat.status)        -- Full
print(dog.status)        -- Hungry (separate object)
```

**Inheritance:**
```lua
local function Dog(name, breed)
    local dog = Pet(name)     -- inherit from Pet
    dog.breed   = breed
    dog.loyalty = 0

    dog.bark = function(self) print("Woof!") end

    dog.feed = function(self)   -- override parent feed
        self.status  = "Full"
        self.loyalty = self.loyalty + 5
    end

    return dog
end
```

Use `.` for properties, `:` for methods.

---

## Coroutines

```lua
local co = coroutine.create(function()
    for i = 1, 10 do
        print(i)
        if i == 5 then coroutine.yield() end   -- pause
    end
end)

coroutine.resume(co)                        -- runs until yield (prints 1–5)
print(coroutine.status(co))                 -- suspended
coroutine.resume(co)                        -- resumes (prints 6–10)
print(coroutine.status(co))                 -- dead
```

**Statuses:** `suspended` · `running` · `normal` · `dead`

---

## Metamethods

Override operators for tables:

```lua
local mt = {
    __add = function(a, b) return {x = a.x + b.x, y = a.y + b.y} end,
    __sub = function(a, b) return {x = a.x - b.x, y = a.y - b.y} end,
}

local v1 = setmetatable({x=10, y=20}, mt)
local v2 = {x=5, y=9}

local res = v1 + v2
print(res.x, res.y)   -- 15  29
```

| Metamethod | Operator |
|------------|----------|
| `__add` | `+` |
| `__sub` | `-` |
| `__mul` | `*` |
| `__div` | `/` |
| `__mod` | `%` |
| `__pow` | `^` |
| `__concat` | `..` |
| `__len` | `#` |
| `__eq` | `==` |
| `__lt` | `<` |
| `__le` | `<=` |
