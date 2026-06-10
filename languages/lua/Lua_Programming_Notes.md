# Lua Programming — Complete Course Notes
### Beginner to Advanced

---

## 1. Introduction to Lua

Lua is a **procedural programming language** — meaning code runs step by step, function by function, following a defined sequence. It is used to:
- Develop general-purpose software
- Work with machine learning
- Create games — from basic text-based games all the way to VR games

One of the most common reasons people learn Lua is because it is **excellent for game development**. It's also widely used alongside **C and C++** because of how easily the two can be integrated together. Many Roblox games, for instance, use Lua under the hood.

**Key characteristics of Lua:**
- **Difficulty:** Relatively easy. No prior programming knowledge is strictly required, though having at least one other language is recommended.
- **Course duration:** Roughly 4–5 hours. You can likely learn the entire language within a week with enough determination.
- **Execution speed:** Very fast, making it excellent for game development.
- **Type:** Procedural (step-by-step) and general purpose (can be used for anything).

**Notable projects made with Lua:**
- Adobe Photoshop Lightroom
- Apache HTTP Server
- Awesome Window Manager
- Roblox
- Angry Birds
- The Sims 2: Nightlife
- Mafia 2
- World of Warcraft
- Fable 2

---

## 2. Installation & Setup

**On Linux (Arch):**
```bash
sudo pacman -S lua
```

**On Windows/Mac:** Download from the official Lua website.

**To verify installation:**
```bash
lua
```
You should see an interactive prompt. Type `hello` and it echoes back. Press `Ctrl + D` to exit.

**Creating your first Lua file:**
1. Create a new file and name it `main.lua`
2. **Important for Windows users:** Make absolutely sure the file ends with `.lua`, not `.lua.txt`. Windows sometimes appends `.txt` automatically.
3. Open it with a code editor (VS Code is recommended — drag and drop the file in).

**Running your Lua file:**
```bash
lua main.lua
```
You must be in the same folder as the file.

---

## 3. Printing Text (Output)

To display text on the screen, use the `print` function:

```lua
print("Hello World")
```

- You can use **single or double quotes** — both work the same way.
- You can have as many `print` statements as you want; each one runs independently.
- The `print` function always outputs text followed by a new line.

```lua
print("Hello World")
print("This is Lua")
print("Any text you want")
```

### String Concatenation with `..`

To combine (concatenate) two strings into one, use two dots `..`:

```lua
print("Hello " .. "Jack")
-- Output: Hello Jack
```

You can chain multiple strings together:

```lua
print("Hello " .. "Jack" .. "! " .. "My name is Steve")
-- Output: Hello Jack! My name is Steve
```

The `..` operator essentially joins the strings end-to-end. Whatever spaces you include are taken literally.

---

## 4. Comments

Comments are notes in your code that **the program completely ignores**. They do not get executed. They are useful for leaving reminders, explaining logic, or temporarily disabling code.

### Single-Line Comments

Use two dashes `--`:

```lua
-- This is a single-line comment
print("Hello World")  -- You can also put a comment at the end of a line
```

Everything after `--` on that line is ignored. The program will not execute it.

If you remove the `--` from in front of random text (like a word not in quotes), you will get an error because Lua will try to read it as code.

### Multi-Line Comments

Use `--[[` to start and `]]` to end:

```lua
--[[
This program is a basic program
to display some text on the screen.
It can span multiple lines.
]]
```

Any code placed inside a multi-line comment will also be ignored. If you move a `print` statement inside the multi-line comment, it will not execute.

---

## 5. Data Types

Lua has a few core types. You do not need to declare what type a variable is — Lua figures it out on its own.

| Type | Description | Example |
|------|-------------|---------|
| `nil` | Nothing / empty / no value | `nil` |
| `number` | Any numeric value, integer or float | `1`, `3.14`, `-22` |
| `string` | Text, wrapped in quotes | `"hello"`, `'world'` |
| `boolean` | True or false (yes or no) | `true`, `false` |
| `table` | Like arrays, dictionaries, objects (covered later) | `{1, 2, 3}` |

**Important:** In Lua, the only **false values** are `false` and `nil`. Everything else is considered truthy, including:
- `0` → **true** (unlike many other languages!)
- `-1` → **true**
- `""` (empty string) → **true**
- `true` → **true**

This is a common source of confusion for developers coming from other languages.

### Checking the Type of a Variable

Use the built-in `type()` function:

```lua
local x = 12
print(type(x))    -- number

local y = "hello"
print(type(y))    -- string

print(type(nil))  -- nil
print(type(false)) -- boolean
```

---

## 6. Variables

A variable is a **named container** that stores a value. Think of it like the `x` from math class — it's just a way to reference a value by name rather than repeating the value everywhere.

### Declaring a Local Variable

Use the `local` keyword:

```lua
local a = 5
local name = "Jack"
local isOld = true
```

Variable names:
- Can contain letters, numbers, and underscores `_`
- **Cannot start with a number**
- **Cannot contain dashes** `-`
- **Are case-sensitive** — `name` and `Name` are two different variables

### Why Use Variables?

Instead of writing "Jack" everywhere in a long program, you store it once:

```lua
local name = "Jack"
print("My name is " .. name .. ". I'm 12 years old. My name, " .. name .. ", is my favourite.")
```

Now if you want to change the name to "Phil", you only change one line. This is especially powerful in large programs with thousands of lines.

### Reassigning and Deleting Variables

You can change a variable's value at any time — just don't use `local` again:

```lua
local name = "Jack"
print(name)   -- Jack

name = 20
print(name)   -- 20

name = false
print(name)   -- false
```

To "delete" a variable (clear it), set it to `nil`:

```lua
name = nil
```

### Concatenating Variables Together

```lua
local name = "Jack"
local surname = "Smither"
local fullName = name .. " " .. surname
print(fullName)  -- Jack Smither
```

### Multi-Line Strings

Use `[[` and `]]` to create a multi-line string:

```lua
local description = [[
Hello World
Color
Please
]]
print(description)
```

The content is taken **literally** — every tab, space, and newline inside is preserved exactly as written.

---

## 7. Scope: Local vs. Global Variables

**Scope** refers to where a variable is accessible in your program. Think of it as boxes — a variable can only be used inside the box (scope) it was created in.

### Local Scope

A `local` variable is only accessible within the block of code where it was declared. If you try to use it outside, you will get `nil`.

```lua
do
    local x = 2
    print(x)   -- 2
end

print(x)   -- nil (x doesn't exist here)
```

### Global Scope

A variable without `local` is global — it can be accessed from anywhere in the program:

```lua
x = 20  -- global
```

Lua convention: **Global variables should start with a capital letter** so you can visually distinguish them from local ones. Some editors will warn you if you define a global without a capital first letter.

A cleaner and more recommended way to declare globals is using `_G`:

```lua
_G.Hello = "Hello there"
```

### Why Local Is Preferred

Local variables are faster (Lua accesses them directly), cleaner (no risk of accidentally overwriting from elsewhere), and safer. Use `local` for everything unless you explicitly need global access.

**Key rule:** Whatever is outside a function/block is accessible inside it. Whatever is inside a function/block is NOT accessible outside it.

---

## 8. Math Operations

Lua can handle all standard math operations. Don't worry — you won't need complex math from school, just the basics.

### Converting a String to a Number

Before doing math on a string containing a number, convert it:

```lua
local str = "22"
print(type(str))          -- string

local num = tonumber(str)
print(type(num))          -- number
```

If the string contains letters, `tonumber()` will return `nil`.

### Basic Arithmetic

```lua
print(5 + 5)     -- 10 (addition)
print(20 - 5)    -- 15 (subtraction)
print(5 * 5)     -- 25 (multiplication)
print(10 / 2)    -- 5  (division)
print(10 % 3)    -- 1  (modulus / remainder)
print(2 ^ 5)     -- 32 (exponentiation / power)
```

Lua has **no issue with negative numbers**:

```lua
print(-22)       -- -22
```

### Operator Precedence (Order of Operations)

Lua follows standard math rules — multiplication and division happen before addition and subtraction (same as BODMAS/PEMDAS). Use brackets to control order:

```lua
print(5 + 10 * 2)     -- 25 (NOT 30 — times first!)
print((5 + 10) * 2)   -- 30 (brackets force addition first)
```

You can use as many layers of brackets as needed.

### Variables in Math

```lua
local x = 5
local y = 10
local z = x + y
print(z)    -- 15
```

### The Math Library

Lua has a built-in `math` library with many useful functions:

```lua
print(math.pi)               -- 3.14159265...

-- Rounding
print(math.floor(3.9))       -- 3  (always rounds DOWN)
print(math.ceil(3.1))        -- 4  (always rounds UP)

-- Trigonometry
print(math.sin(45))
print(math.cos(20))          -- 0.40

-- Min / Max
print(math.min(5, 3, 10, 1)) -- 1
print(math.max(5, 3, 10, 1)) -- 10

-- Absolute value (positive version of a number)
print(math.abs(-5))          -- 5
```

### Random Numbers

```lua
print(math.random())         -- random float between 0 and 1
print(math.random(10))       -- random integer between 1 and 10
print(math.random(10, 50))   -- random integer between 10 and 50
```

**Important:** Computers aren't truly random. To get different results each run, seed the random generator with the current time:

```lua
math.randomseed(os.time())
print(math.random(10))
```

`os.time()` returns the current Unix timestamp (seconds since 1970), so every second the seed is different and you get genuinely different random numbers.

---

## 9. Strings (Text Manipulation)

Strings are sequences of characters — basically any text. Single and double quotes work the same way. There is no separate "character" type in Lua — even a single letter is a string.

```lua
local str = "Hello World"
local str2 = 'Hello World'   -- same thing
```

### String Length

Use `#` operator or `string.len()`:

```lua
local str = "Hello World"
print(#str)            -- 11
print(string.len(str)) -- 11
```

### Multi-Line Strings

```lua
local multiLine = [[
Hello World
My name is Jack
2 + 2 is equal to 4
]]
print(multiLine)
```

Content is taken literally — every tab and newline is preserved.

### Concatenation (Joining Strings)

```lua
local str = "Hello"
str = str .. " World"
print(str)  -- Hello World
```

### Case Conversion

```lua
local str = "Hello World"
print(string.lower(str))  -- hello world
print(string.upper(str))  -- HELLO WORLD
```

### Substrings (Extracting Part of a String)

```lua
local str = "Hello World"
print(string.sub(str, 1, 5))   -- Hello (positions 1 to 5)
print(string.sub(str, 7, 99))  -- World (from position 7 to end)
```

Positions start at **1**, not 0 (unlike many other languages).

### Converting Number to String

```lua
local x = 22
local y = tostring(x)
print(type(y))  -- string
```

### Escape Characters

Escape characters are special characters that you add to strings using a backslash `\`:

| Escape | Meaning |
|--------|---------|
| `\n` | New line |
| `\t` | Horizontal tab |
| `\v` | Vertical tab |
| `\\` | Literal backslash |
| `\"` | Literal double quote |
| `\'` | Literal single quote |
| `/` | Forward slash (no escape needed) |

```lua
print("Hello\nWorld")         -- Hello on one line, World on next
print("Hello\tWorld")         -- Hello    World (with tab)
print("I am \"Steve\"")       -- I am "Steve"
print("C:\\Users\\name")      -- C:\Users\name
```

### ASCII Conversion

```lua
print(string.char(65))   -- A (ASCII 65 = capital A)
print(string.byte("A"))  -- 65
print(string.byte("a"))  -- 97 (lowercase a = 97)

-- Convert an entire string to bytes
local str = "Hello"
print(string.byte(str, 1, 99))  -- prints all byte values
```

### Repeating a String

```lua
print(string.rep("Hello", 10, ", "))
-- Hello, Hello, Hello, Hello, Hello, Hello, Hello, Hello, Hello, Hello
```

Arguments: what to repeat, how many times, separator.

### Formatting Strings

Similar to C-style `printf`:

```lua
print(string.format("Pi to 2 decimal places: %.2f", math.pi))  -- 3.14
print(string.format("My age is: %i", 18))                       -- 18
print(string.format("Pi to 10 places: %.10f", math.pi))         -- 3.1415926536
```

- `%f` — floating point number
- `%i` — integer
- `%s` — string

### Finding Substrings

```lua
local str = "Hello World"
print(string.find(str, "World"))  -- 7  11 (start and end positions)
print(string.find(str, "xyz"))    -- nil (not found)
```

### Matching

```lua
local str = "Hello World"
print(string.match(str, "World"))  -- World (returns the matched string)
print(string.match(str, "xyz"))    -- nil
```

You can also store the start/end positions:

```lua
local beginning, ending = string.find(str, "World")
print(beginning)  -- 7
print(ending)     -- 11
```

### Replacing (gsub)

`gsub` stands for "global substitution" — it replaces all occurrences:

```lua
local str = "Hello World"
print(string.gsub(str, "o", "!"))   -- Hell! W!rld   2
-- returns the new string AND a count of replacements
```

```lua
print(string.gsub(str, "l", "happy"))  -- Hehappyhappy Worhappyd   3
```

---

## 10. If Statements (Logic / Conditionals)

If statements allow you to add logic to your code — making decisions based on conditions. This is where programming really starts to feel powerful.

```lua
if true then
    print("Statement was true")
end
```

If the condition is `false` or `nil`, the block does not execute.

### Comparison Operators

| Operator | Meaning |
|----------|---------|
| `>` | Greater than |
| `<` | Less than |
| `>=` | Greater than or equal to |
| `<=` | Less than or equal to |
| `~=` | Not equal to (**note: NOT `!=` like other languages!**) |
| `==` | Equal to |

```lua
local age = 18

if age > 17 then
    print("You may enter")
end
```

### If / Else

```lua
local age = 15

if age > 20 then
    print("You are old")
else
    print("You are young")
end
```

If the `if` condition is false, the `else` block runs. Only one of them can ever run.

### If / Else If / Else

```lua
local age = 9

if age > 20 then
    print("You are old")
elseif age > 10 then
    print("You are not old or young")
elseif age > 5 then
    print("Boohoo")
else
    print("You are very young")
end
```

- Each `elseif` is checked in order. The first one that matches runs, and the rest are skipped.
- You can have **as many `elseif` blocks as you want**.
- You can only have **one `else`** block per `if` statement.
- The `else` block runs if none of the above conditions matched.

### Logical Operators (and / or / not)

**`and`** — both conditions must be true:
```lua
if age > 17 and age < 60 then
    print("You may enter")
end
-- only executes if age is more than 17 AND less than 60
```

**`or`** — at least one condition must be true:
```lua
if age > 17 or age < 10 then
    print("You may enter")
end
-- executes if EITHER condition is true
```

**Truth table for `and`:**
- `true and true` → executes
- `true and false` → does NOT execute
- `false and true` → does NOT execute
- `false and false` → does NOT execute

**Truth table for `or`:**
- `true or true` → executes
- `true or false` → executes
- `false or true` → executes
- `false or false` → does NOT execute

**`not`** — inverts the boolean value:
```lua
if not age < 18 then
    print("You may enter")
end
-- if "age < 18" is false, "not false" becomes true, so it executes
```

`not true` = `false`. `not false` = `true`.

### String and Number Comparisons

You can compare strings just like numbers:

```lua
local name = "Tom"
if name == "Tom" then
    print("You may enter")
end
```

You can also combine conditions:

```lua
if name == "Tom" and age == 10 then
    print("You may enter")
end
```

### Nested If Statements

You can put if statements inside other if statements:

```lua
if age > 10 then
    if type(age) == "number" then
        print("Age is a valid number greater than 10")
    end
end
```

### Ternary Operator (Lua Style)

Lua doesn't have a traditional ternary operator like `condition ? a : b`. Instead, you can use an `and`/`or` trick:

```lua
local age = 33
local old = age > 30 and true or false
print(old)  -- true
```

How it works: `age > 30` returns true, so `true and true` is `true`. Since the `or` already has a truthy left side, it returns `true`. If `age > 30` were false, `false and true` is `false`, so `or false` returns `false`.

You can also use a wrapped if statement for clarity:

```lua
local old
if age > 30 then
    old = true
else
    old = false
end
```

---

## 11. Loops

Loops are one of the most powerful concepts in programming. They let you repeat a block of code multiple times without rewriting it.

### The For Loop

```lua
for i = 1, 10 do
    print(i)
end
-- prints 1 through 10
```

**Structure:** `for variable = start, end, step do`

- `i` is a local variable automatically created by the loop
- It starts at `1`, goes up to `10`, by default incrementing by `1`
- After the loop, `i` no longer exists (local scope)

**Specifying a step:**

```lua
for i = 1, 10, 2 do
    print(i)
end
-- 1 3 5 7 9 (skips by 2)

for i = 2, 10, 2 do
    print(i)
end
-- 2 4 6 8 10 (even numbers only)
```

**Counting backwards:**

```lua
for i = 10, 1, -1 do
    print(i)
end
-- 10 9 8 7 ... 1
```

You **must** specify a negative step when counting down. Without `-1`, Lua has an invisible check that says "is `i` less than or equal to the end value?" and since 10 is not ≤ 1, the loop never runs.

**Using variables as loop bounds:**

```lua
local startVal = 1
local endVal   = 10
local stepVal  = 1

for i = startVal, endVal, stepVal do
    print(i)
end
```

**Looping through an array:**

```lua
local arr = {5, 10, 15, 20, 25}

for i = 1, #arr do
    print(arr[i])
end
```

`#arr` returns the length of the array. This pattern is very common.

### The While Loop

A while loop runs **as long as a condition is true**:

```lua
local peeps = 10

while peeps > 0 do
    print("People left at party: " .. peeps)
    peeps = peeps - 1
end
-- counts down from 10 to 1
```

**Infinite loops:** If the condition never becomes false, the loop runs forever (crashing or freezing the program). Be careful.

**Application loop pattern:**

```lua
local run = true
local runTime = 0

while run do
    print("Running...")
    if runTime == 10 then
        run = false  -- exit condition
    end
    runTime = runTime + 1
end
```

This is the pattern used in real-world applications and games — the program keeps running in a loop until some exit condition is met.

### The Repeat...Until Loop

A `repeat...until` loop runs the body **at least once**, then checks the condition:

```lua
local x = 1

repeat
    print("Hey there")
    x = x + 1
until x > 10
```

**Key difference vs. while loop:** With `while`, if the condition is already false before the loop starts, the body never runs. With `repeat...until`, the body always runs at least once before the condition is checked.

```lua
local x = 11

while x < 10 do
    print("This never runs")
end

repeat
    print("This runs once!")
    x = x + 1
until x > 10
```

**Important distinction:** While loops run while the condition is `true`. Repeat loops run until the condition becomes `true` — meaning they continue while the condition is `false`. They work in opposite logical ways:

- `while` → continues while condition is **true**
- `repeat...until` → continues while condition is **false** (stops when it becomes **true**)

---

## 12. User Input

Getting input from the user is one of the most exciting things to learn — it makes your programs interactive.

### Basic Input

```lua
local answer = io.read()
print(answer)
```

This pauses the program and waits for the user to type something, then stores it in `answer`.

### Simple Q&A Example

```lua
print("What is 10 + 5?")
local ans = io.read()
print("Your answer: " .. ans)
```

### Inline Prompt (No Newline)

`print()` always adds a newline. To display text without a newline (e.g., to keep the input on the same line as the prompt), use `io.write()`:

```lua
io.write("Enter your answer: ")
local ans = io.read()
print("You said: " .. ans)
```

### Math Game Example

```lua
local num1 = 10
local num2 = 5

io.write(num1 .. " + " .. num2 .. " = ")
local ans = io.read()
local trueAnswer = num1 + num2

if tonumber(ans) == trueAnswer then
    print("You are correct!")
else
    print("Your answer " .. ans .. " is incorrect. Try again.")
end
```

**Important:** `io.read()` always returns a **string**. If you want to compare it to a number, you must convert it with `tonumber()`.

---

## 13. Tables

Tables are the most versatile data structure in Lua. They represent **arrays, records, sets, lists, queues, dictionaries** — basically everything that can hold multiple values.

A table is like a container for multiple variables, stored under one name.

### Creating a Table

```lua
local arr = {10, 15, 20}
```

This is equivalent to having `local x = 10`, `local y = 15`, `local z = 20` — but stored in one variable.

### Accessing Elements

Tables in Lua are **1-indexed** (start at 1, not 0):

```lua
local arr = {10, 15, 20}

print(arr[1])  -- 10
print(arr[2])  -- 15
print(arr[3])  -- 20
print(arr[4])  -- nil (no value there)
```

### Tables Can Hold Mixed Types

```lua
local arr = {10, true, "Hello World", 2.4}

print(arr[1])  -- 10
print(arr[2])  -- true
print(arr[3])  -- Hello World
print(arr[4])  -- 2.4
```

### Getting the Length

```lua
local arr = {10, 15, 20, 2.4}
print(#arr)       -- 4
print(arr[#arr])  -- 2.4 (last element)
```

### Printing a Table (You Can't Directly)

```lua
print(arr)   -- table: 0x... (a memory address, not the contents)
```

To print the contents, loop through it.

### Sorting a Table

```lua
local arr = {50, 10, 23, 1, 0, 15}
table.sort(arr)
print(arr[1])  -- 0 (smallest, now first)
print(arr[2])  -- 1
```

### Looping Through a Table

```lua
local arr = {5, 10, 15, 20}

for i = 1, #arr do
    print(arr[i])
end
```

### Inserting Into a Table

```lua
local arr = {10, 15, 23, 50}
table.insert(arr, 2, "low")   -- inserts "low" at index 2
-- arr is now {10, "low", 15, 23, 50}
```

Arguments: table, position, value.

### Removing From a Table

```lua
table.remove(arr, 4)   -- removes the element at index 4
```

### Concatenating a Table Into a String

```lua
local arr = {"Hello", "World", "I", "am", "Steve"}
print(table.concat(arr, " "))    -- Hello World I am Steve
print(table.concat(arr, ", "))   -- Hello, World, I, am, Steve
print(table.concat(arr, "!!!"))  -- Hello!!!World!!!I!!!am!!!Steve
```

### Multi-Dimensional Tables (Tables Within Tables)

```lua
local matrix = {
    {1, 2, 3},
    {4, 6, 8, 0},
    {9, 99, 9, 8, 9}
}

print(matrix[1][1])  -- 1  (first table, first element)
print(matrix[2][1])  -- 4  (second table, first element)
print(matrix[3][2])  -- 99 (third table, second element)
```

### Looping Through a Multi-Dimensional Table

```lua
for i = 1, #matrix do
    for j = 1, #matrix[i] do
        print(matrix[i][j])
    end
end
```

The outer loop goes through each inner table. The inner loop goes through each element inside each inner table.

---

## 14. Functions

A function is a **named, reusable block of code**. Instead of copying and pasting the same code multiple times, you write it once in a function and call it as many times as needed.

**Why functions matter:** Without functions, if you have the same 20 lines of code in 50 places in a 10,000-line program and you need to change one thing — you have to update it 50 times. With a function, you change it once.

### Creating and Calling a Function

```lua
local function displayAge()
    print("You are 5 years old")
    print("You will be 7 years old in two years")
    print("You were 4 years old last year")
end

displayAge()   -- call once
displayAge()   -- call again
displayAge()   -- call a third time
```

### Parameters

Parameters allow you to pass values into a function:

```lua
local function displayAge(age)
    print("You are " .. age .. " years old")
    print("You will be " .. (age + 2) .. " years old in two years")
    print("You were " .. (age - 1) .. " years old last year")
end

displayAge(22)   -- You are 22 years old...
displayAge(5)    -- You are 5 years old...
displayAge(13)   -- You are 13 years old...
```

You can pass in as many different values as needed. The parameter (`age`) inside the function is a local variable that gets the value you pass in.

### Default Parameters

If you want the function to work even when no argument is passed in, provide a default:

```lua
local function displayAge(age)
    age = age or 5   -- if age is nil, use 5
    print("You are " .. age .. " years old")
end

displayAge(22)  -- You are 22 years old
displayAge()    -- You are 5 years old (default)
```

**Important:** `age = age or 5` works because `nil or 5` returns `5`. If `age` has a real value, `age or 5` returns `age`. Make sure `age` comes first — `5 or age` would always return 5 regardless.

### Return Values

Functions can compute and return a value:

```lua
local function sum(num1, num2)
    return num1 + num2
end

local x = sum(2, 3)
print(x)   -- 5
```

Once `return` is reached, the function stops immediately. You cannot put code after `return` — it will cause an error.

### Returning Multiple Values

```lua
local function addTen(number)
    local outcome = 10 + number
    return number, outcome
end

local stored, output = addTen(20)
print(stored .. " had 10 added to it and we get " .. output)
-- 20 had 10 added to it and we get 30
```

If you don't plan to use one of the returned values, use `_` as a placeholder by convention:

```lua
local _, output = addTen(20)
```

### Local vs. Global Functions

A `local` function is only accessible within the file it's defined in. A global function (no `local` keyword) is accessible from anywhere. Best practice: always use `local` unless you explicitly need global access.

### Alternate Function Syntax (Storing as Variable)

```lua
local addTen = function(num)
    return 10 + num
end

print(addTen(5))   -- 15
```

### Variable Arguments (`...`)

If you don't know how many arguments will be passed in, use `...`:

```lua
local function sum(...)
    local args = {...}   -- convert to table
    local total = 0
    for key, value in pairs(args) do
        total = total + value
    end
    return total
end

print(sum(10, 5, 9, 0, 14))   -- 38
```

`...` collects all passed arguments. Wrapping it in `{}` converts it into a proper table so you can loop through it with `pairs`.

### Scope Within Functions

- Variables declared with `local` inside a function cannot be accessed outside it.
- Variables declared outside a function can be accessed inside it.

```lua
local z = 10

local function myFunc()
    print(z)    -- 10 — accessible because z is outside
    local y = 5
end

myFunc()
print(y)    -- nil — y is inside the function, can't access here
```

To make an inner variable accessible globally, use `_G`:

```lua
local function myFunc()
    _G.y = 5   -- now globally accessible
end
```

### Recursion

Recursion is when a function calls **itself** until it reaches a base condition:

```lua
local function counter(number, endNum)
    local count = number + 1
    if count < endNum then
        print(count)
        return counter(count, endNum)   -- calls itself!
    end
    return count
end

print(counter(10, 15))
-- prints 11, 12, 13, 14, then returns 15
```

What's happening: the function runs, increments `count`, checks if it should keep going, and if yes — calls itself with the new count. This repeats until `count >= endNum`.

---

## 15. Anonymous Functions

An **anonymous function** is a function without a name. It is often used when you want to return a function from another function or pass a function as a value.

```lua
local function counter()
    local count = 0
    return function()   -- anonymous function returned
        count = count + 1
        return count
    end
end

local x = counter()   -- x is now the anonymous function
print(x())  -- 1
print(x())  -- 2
print(x())  -- 3
print(x())  -- 4
```

**What's happening here:**
1. `counter()` is called, creating a local variable `count = 0`
2. It returns an anonymous function that closes over (remembers) `count`
3. `x` is assigned that anonymous function
4. Every time `x()` is called, it increments `count` and returns it
5. `count` persists between calls because the anonymous function remembers its environment — this is called a **closure**

This is a powerful concept: functions that remember state between calls.

---

## 16. Coroutines

A **coroutine** is like a function that can be paused midway and resumed later, allowing other code to run in the meantime. Think of it like an async/await pattern — a task can yield (pause), let another task run, then resume.

### Creating a Coroutine

```lua
local routine1 = coroutine.create(function()
    for i = 1, 10 do
        print("Routine 1: " .. i)
        if i == 5 then
            coroutine.yield()   -- PAUSE here
        end
    end
end)
```

### Statuses

A coroutine can be in one of four states:

| Status | Meaning |
|--------|---------|
| `suspended` | Not running — either hasn't started or was yielded |
| `running` | Currently executing |
| `normal` | Active but not running (called by another coroutine) |
| `dead` | Finished executing or stopped with an error |

```lua
print(coroutine.status(routine1))  -- suspended (not started yet)
```

### Starting / Resuming a Coroutine

```lua
coroutine.resume(routine1)
-- prints 1 through 5, then pauses at yield

print(coroutine.status(routine1))  -- suspended (yielded, not dead)

coroutine.resume(routine1)
-- resumes from where it yielded, prints 6 through 10

print(coroutine.status(routine1))  -- dead (finished)
```

### Two Coroutines Interleaving

```lua
local routineFunc = function()
    for i = 11, 20 do
        print("Routine 2: " .. i)
    end
end

local routine2 = coroutine.create(routineFunc)

coroutine.resume(routine1)   -- runs until yield at 5
coroutine.resume(routine2)   -- runs routine 2 (11-20)
coroutine.resume(routine1)   -- resumes routine 1 (6-10)
```

Output: Routine 1 runs to 5, then Routine 2 runs fully 11–20, then Routine 1 continues 6–10.

### Checking Status Before Resuming

```lua
if coroutine.status(routine1) == "suspended" then
    coroutine.resume(routine1)
end
```

### Real-World Use Case

Imagine a file copying progress bar. Each megabyte copied could yield the "copy coroutine", allowing the UI/loading bar coroutine to update and display progress, then the copy coroutine resumes for the next megabyte. This creates smooth, interleaved execution without needing threads.

---

## 17. File I/O (Reading and Writing Files)

Lua can read from and write to files on your computer. There are two ways to do this.

### Simple Method: io.output / io.input

**Writing:**

```lua
io.output("myfile.txt")   -- open/create file (overwrites if exists!)
io.write("Hello World")   -- write content
io.close()                -- always close files!
```

`io.output()` creates the file if it doesn't exist, or **completely empties** the file if it does. Always call `io.close()` — not closing files can cause memory leaks and errors.

**Reading:**

```lua
io.input("myfile.txt")
local file = io.read(5)    -- reads 5 characters
print(file)

local file = io.read("*number")   -- reads a number
local file = io.read("*line")     -- reads one line (moves to next)
local file = io.read("*all")      -- reads entire file
```

### Advanced Method: io.open

```lua
local file = io.open("myfile.txt", "w")   -- open for writing
file:write("My name is Nitsu")
file:close()
```

**Mode flags:**

| Mode | Meaning |
|------|---------|
| `"r"` | Read mode |
| `"w"` | Write mode (overwrites existing content) |
| `"a"` | Append mode (adds to end, doesn't overwrite) |
| `"r+"` | Read/write mode |
| `"w+"` | Read/write, erases previous content |

**Appending to a file:**

```lua
local file = io.open("myfile.txt", "a")
file:write("\nJack he is old")
file:write("\nNitsu: Yeah I know")
file:close()
-- Adds to the end each time. Running again adds it again.
```

**Reading with io.open:**

```lua
local file = io.open("myfile.txt", "r")
local content = file:read("*all")   -- reads entire file
file:close()
print(content)

-- Or line by line:
local file = io.open("myfile.txt", "r")
local line = file:read("*line")
print(line)
file:close()
```

---

## 18. The OS Module

The `os` module lets you interact with your operating system — get the current time, work with dates, access environment variables, run terminal commands, rename/delete files, and time code execution.

### Getting the Current Time

```lua
print(os.time())   -- Unix timestamp: seconds since January 1, 1970
```

### Getting Time for a Specific Date

```lua
local past = os.time({
    year  = 2000,
    month = 10,
    day   = 1,
    hour  = 13,
    min   = 20,
    sec   = 10
})
print(past)
```

### Time Difference

```lua
local past = os.time({ year=2000, month=10, day=1 })
print(os.time() - past)       -- seconds between then and now
print(os.difftime(os.time(), past))   -- built-in helper, same result
```

### Getting the Current Date

```lua
print(os.date())   -- e.g., "Friday Jul 23 19:00:00 2021"
```

### Environment Variables

Environment variables are system-level settings. For example, `$HOME` stores the path to the current user's home directory.

```lua
print(os.getenv("HOME"))   -- /home/netsu
print(os.getenv("USER"))   -- netsu
```

These work on Linux/Mac. On Windows the variable names may differ slightly.

### Renaming Files

```lua
os.rename("myfile.txt", "newname.js")   -- renames the file
```

### Removing Files

```lua
os.remove("newname.js")   -- deletes the file permanently
```

### Executing Terminal Commands

```lua
os.execute("whoami")   -- runs "whoami" in the terminal
```

**⚠️ WARNING: This is extremely dangerous. Avoid unless absolutely necessary.**

Two reasons:
1. **Destructive potential:** A typo like `rm -rf /` instead of `rm -rf /tmp/myfile` could destroy your entire operating system with no undo.
2. **Not cross-platform:** `clear` works on Linux/Mac, `cls` works on Windows. Code using `os.execute` won't be portable between operating systems.

### Timing Code Execution

```lua
local start = os.clock()

for i = 1, 1000000 do
    local x = 10
end

print("Time taken: " .. os.clock() - start .. " seconds")
```

`os.clock()` returns CPU time used — ideal for benchmarking loops and functions.

### Exiting the Program

```lua
os.exit()   -- terminates the program immediately
```

```lua
for i = 1, 10 do
    if i == 5 then
        os.exit()   -- stops at 5
    end
    print(i)
end
```

---

## 19. Modules

A **module** is a Lua file that returns a single table. That table contains functions and values the user can access. It's how Lua implements libraries.

You've already been using modules: `math.pi`, `os.exit()`, `string.lower()` — these are all functions from Lua's built-in modules.

A **package** is a collection of modules.

### Creating Your Own Module

Create a file `mymath.lua`:

```lua
-- mymath.lua

local mymath = {}   -- the table we'll return

function mymath.add(x, y)
    return x + y
end

function mymath.power(num1, num2)
    return num1 ^ num2
end

return mymath   -- return the table at the end
```

**Important:** Functions inside a module **cannot** be declared with `local` at the front (e.g., `local function mymath.add(...)` is invalid). They must be global functions assigned to the table.

### Importing and Using a Module

In `main.lua`:

```lua
local mod = require("mymath")   -- loads mymath.lua

print(mod.add(5, 10))        -- 15
print(mod.power(2, 5))       -- 32
```

`require("mymath")` looks for a file called `mymath.lua` in the same directory. You only need to run `main.lua` — it automatically loads `mymath.lua`.

Unlike built-in modules like `os`, custom modules must be imported with `require`.

---

## 20. Object-Oriented Programming (OOP)

OOP is a **way of thinking** about your code. Instead of having a bunch of functions, you think about everything as **objects**.

In game development, this is very natural: the player is an object, an enemy is an object, a trash can is an object. Objects have properties (data) and behaviours (functions).

### Lua and OOP

Lua is **not** an OOP language. It doesn't have built-in classes or objects like Python, Java, or C++. However, you can **simulate** OOP using functions and tables.

### Simulating an Object with a Table

```lua
local t = {
    name = "Jack",
    age = 18,
    friends = {"Fred"}
}

print(t.name)   -- Jack
```

A table with named fields essentially acts like an object.

### Creating a Class-Like Constructor

```lua
local function Pet(name)
    name = name or "Louis"   -- default name

    return {
        name   = name,
        status = "Hungry",

        feed = function(self)
            self.status = "Full"
            print(self.name .. " is fed")
        end
    }
end
```

**Usage:**

```lua
local cat = Pet("Kitty")
local dog = Pet()        -- uses default "Louis"

print(cat.name)          -- Kitty
print(dog.name)          -- Louis

print(cat.status)        -- Hungry
cat:feed()               -- Kitty is fed (colon syntax for methods!)
print(cat.status)        -- Full
print(dog.status)        -- Hungry (dog unaffected — separate object)
```

**Important syntax difference:**
- `cat.name` — accessing a value with a dot
- `cat:feed()` — calling a method with a **colon** (automatically passes `self`)

`self` inside a method refers to the object itself, allowing access to other fields of the same object.

**As best practice**, capitalize the first letter of your constructor functions: `Pet`, not `pet`. This signals "this is a class-like thing."

### Inheritance

You can create a "subclass" by starting with an existing object and adding more to it:

```lua
local function Dog(name, breed)
    local dog = Pet(name)   -- inherit from Pet

    dog.breed   = breed
    dog.loyalty = 0

    dog.isLoyal = function(self)
        return self.loyalty >= 10
    end

    dog.bark = function(self)
        print("Woof!")
    end

    -- Override the feed function to also increase loyalty
    dog.feed = function(self)
        self.status  = "Full"
        self.loyalty = self.loyalty + 5
        print(self.name .. " is fed")
    end

    return dog
end
```

**Usage:**

```lua
local lassie = Dog("Lassie", "Poodle")

print(lassie.breed)   -- Poodle
lassie:bark()         -- Woof!

print(lassie:isLoyal())   -- false (loyalty is 0)
lassie:feed()             -- Lassie is fed (loyalty now 5)
lassie:feed()             -- Lassie is fed (loyalty now 10)
print(lassie:isLoyal())   -- true

if lassie:isLoyal() then
    print("Will protect against intruder")
else
    print("Will not protect against intruder")
end
```

Lassie **inherits** everything from `Pet` (name, status, basic feed) but also has dog-specific things (breed, loyalty, bark, enhanced feed).

### Why OOP Matters

When you have a game with:
- A **player**
- Multiple types of **enemies**
- **NPCs** you can talk to

You could have a base `Entity` object with common properties (health, position, name), and then `Player`, `Enemy`, and `NPC` extend it — each adding their own special behaviour, while sharing the base code.

---

## 21. Metamethods (Meta Tables)

Meta methods allow you to **change how operators work** on your custom tables. By default, Lua doesn't know how to add two tables together — but you can define what `+` means for your tables.

### The Problem

```lua
local tbl1 = {num = 50}
local tbl2 = {num = 10}

local ans = tbl1 + tbl2   -- ERROR: attempt to perform arithmetic on a table value
```

Lua doesn't know how to add these. We need to tell it.

### Setting Up a Metatable

```lua
local function addTables(x, y)
    return {x = x.x + y.x, y = x.y + y.y}
end

local metaTable = {
    __add = addTables   -- redefine the + operator
}

setmetatable(tbl1, metaTable)   -- apply to tbl1

local ans = tbl1 + tbl2
print(ans.x, ans.y)
```

Now when `+` is used with `tbl1`, Lua calls `addTables` instead.

### Using Anonymous Functions

```lua
local metaTable = {
    __add = function(x, y)
        return x.num + y.num
    end,

    __sub = function(x, y)
        return x.num - y.num
    end
}

setmetatable(tbl1, metaTable)

print(tbl1 + tbl2)   -- 60
print(tbl1 - tbl2)   -- 40
```

### All Available Metamethods

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

### Vector Example

```lua
local v1 = {x = 10, y = 20}
local v2 = {x = 5,  y = 9}

local vectorMeta = {
    __add = function(a, b)
        return {x = a.x + b.x, y = a.y + b.y}
    end
}

setmetatable(v1, vectorMeta)

local result = v1 + v2
print("x: " .. result.x)  -- x: 15
print("y: " .. result.y)  -- y: 29
```

This is especially useful in **game development** where you frequently add coordinate vectors. Instead of calling a function every time, you can just use `+` naturally.

---

## 22. Where to Go From Here

Now that you have learned Lua, here are some recommended next steps:

### Continue with Lua

- **Lua Rocks** (`luarocks.org`) — Lua's package manager. Find libraries like:
  - `LuaFileSystem` — better file system operations than `os`
  - `LuaSQLite` — work with SQLite databases
  - Many others

- **Roblox development** — Roblox uses a modified version of Lua (Luau) for all game scripting. Great for those interested in game development.

- **LÖVE2D** — A free, lightweight framework for making 2D games in Lua. Great for learning game development fundamentals. Core concept: load, update, and draw in a loop.

### Branch Into Related Languages

- **C / C++** — Lua is often used as an embedded scripting language inside C or C++ programs. Learning C++ opens up more professional game development paths (Unreal Engine, etc.).

- **Python** — Python is very similar to Lua in many ways. Often described as "Lua but more popular." If you enjoyed Lua, Python will feel natural. It has an enormous ecosystem of libraries.

### General Advice

Lua is a genuinely excellent language — fast, small, embeddable, and elegant. Whether you use it for scripting, game development, or embedding in larger applications, the fundamentals you have learned here transfer directly.

---

*Notes compiled from the Full Lua Programming Crash Course — Beginner to Advanced*
