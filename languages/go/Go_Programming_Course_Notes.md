# Go Programming — Comprehensive Course Notes

> **Source:** Golang Course with Bonus Projects (FreeCodeCamp / Boot.dev)
> **Instructors:** Lane Wagner (7+ years Go, 10+ years software) & Alan Lers
> **Format:** 100+ hands-on coding lessons → Production backend project (RSS Aggregator)

---

## Table of Contents

1. [Why Go?](#1-why-go)
2. [Compilation vs Interpretation](#2-compilation-vs-interpretation)
3. [Distributing Programs](#3-distributing-programs)
4. [Type System](#4-type-system)
5. [Variables & Constants](#5-variables--constants)
6. [String Formatting](#6-string-formatting)
7. [Conditionals](#7-conditionals)
8. [Functions](#8-functions)
9. [Structs](#9-structs)
10. [Methods on Structs](#10-methods-on-structs)
11. [Interfaces](#11-interfaces)
12. [Errors](#12-errors)
13. [Loops](#13-loops)
14. [Arrays & Slices](#14-arrays--slices)
15. [Maps](#15-maps)
16. [Advanced Functions (First-Class, Higher-Order, Closures, Currying)](#16-advanced-functions)
17. [Pointers](#17-pointers)
18. [Packages & Modules](#18-packages--modules)
19. [Local Development Setup](#19-local-development-setup)
20. [Concurrency — Goroutines & WaitGroups](#20-concurrency--goroutines--waitgroups)
21. [Channels](#21-channels)
22. [Project: RSS Aggregator (Full Backend Server)](#22-project-rss-aggregator)

---

## 1. Why Go?

### Performance Overview

Go sits in an interesting performance position among languages:

| Category | Languages | Notes |
|---|---|---|
| Interpreted (slower at runtime) | Python, JavaScript, Ruby, PHP | No compilation step; interpreter converts source → machine code at runtime |
| Go | **Compiled** | Faster than all interpreted languages at runtime |
| JVM-based (virtual machine overhead) | Java, C# | Fast but memory-hungry; Go is ~100x more memory efficient idle |
| Natively compiled (fastest) | Rust, C, C++ | Slightly faster than Go due to no runtime overhead |

**Key Go advantages:**
- **Execution speed:** Much faster than interpreted languages.
- **Compilation speed:** Much faster to compile than Rust, C, C++. A large Go program compiles in seconds; comparable C++ programs can take over an hour.
- **Memory usage:** Far less than Java/JVM at idle (measured as ~100x less in benchmark tests for a REST server). Slightly more than Rust/C due to the Go runtime.
- **Fast iteration:** Quick compile → short dev feedback loop → quicker deployments.
- **No runtime dependency:** Compiled binaries run standalone, unlike Python or Node.js programs.

### Why Go for Backend?
- Scalable backend infrastructure.
- Easy to learn, amazing developer experience.
- Modern tech companies (fast-growing ones especially) build backend systems in Go.
- Strong, static typing catches bugs at compile time — not in production.

---

## 2. Compilation vs Interpretation

### What is Compilation?

Human-readable source code (`.go` files) → **Go compiler** → machine code binary (`.exe` or native binary).

```
main.go  →  [go build]  →  hello_world  (executable binary)
```

- Your CPU **only understands binary** (machine code: ones and zeros).
- Compilation converts your readable Go code into that binary format upfront.
- The resulting binary can be **given to anyone** — they can run it without installing Go.

### Compile-time vs Runtime Errors

- **Compile-time error:** Caught before the program ever runs. Example: missing closing parenthesis, type mismatch. The compiler refuses to produce a binary.
- **Runtime error:** Caught while the program is running. Example: dividing by zero, nil pointer dereference (panics).

Go's strong type system catches a large class of bugs at compile time.

### The `go build` Command

```bash
go build          # compiles current package → produces binary named after directory
go run main.go    # compiles + immediately runs (NOT suitable for production; no binary saved)
```

---

## 3. Distributing Programs

### Interpreted Languages (e.g. Python)

```bash
# To share your script, you give the .py file:
python main.py
```

**Problems:**
1. The recipient must have Python installed.
2. Your source code is fully exposed — no way to protect intellectual property.

### Compiled Languages (e.g. Go)

```bash
go build          # produces hello_world binary
./hello_world     # runs on ANY machine with the same OS/arch — no Go needed
```

**Advantages:**
1. Recipient does NOT need Go installed.
2. Source code is NOT included in the binary.
3. No runtime dependency (no interpreter, no JVM).
4. Simpler server deployment: just copy the binary.

---

## 4. Type System

### Go is Strongly and Statically Typed

- **Static typing:** Every variable's type is known at compile time and cannot change.
- **Strong typing:** You cannot accidentally mix types (e.g. adding a string to an integer causes a compile error).
- This is similar to TypeScript over JavaScript — many JS developers adopt TypeScript specifically for static types.

### Primitive Types

| Category | Types | Notes |
|---|---|---|
| Boolean | `bool` | `true` or `false` |
| String | `string` | Double-quoted: `"hello"` |
| Integer | `int`, `int8`, `int16`, `int32`, `int64` | Signed; `int` aliases `int32` or `int64` based on CPU arch |
| Unsigned Integer | `uint`, `uint8`, `uint16`, `uint32`, `uint64` | Non-negative only |
| Float | `float32`, `float64` | Decimal numbers |
| Complex | `complex64`, `complex128` | Imaginary numbers; rarely used in production |
| Byte | `byte` | Alias for `uint8`; 8 bits |
| Rune | `rune` | Alias for `int32`; represents a Unicode code point (one character) |

**Important: Size means bits.**
- `uint8` → max value 255 (2^8 - 1)
- `uint16` → max value ~65,000 (2^16 - 1)
- `float64` can represent more values than `float32`

**When to use specific sizes:** Only when performance/memory is critical. Otherwise always use the defaults: `int`, `uint`, `float64`.

### Type Conversions

Go requires **explicit type conversion** — no implicit casting:

```go
var i int = 88
f := float64(i)     // i becomes 88.0

var f2 float64 = 88.6
i2 := int(f2)       // i2 becomes 88 — truncates (does NOT round)
```

---

## 5. Variables & Constants

### Long-form Variable Declaration

```go
var smsLimit int         // declares with zero value (0)
var cost float64         // zero value (0.0)
var hasPermission bool   // zero value (false)
var username string      // zero value ("")
```

Zero values by type:
- `int`, `float64`, etc. → `0` / `0.0`
- `bool` → `false`
- `string` → `""`
- Pointers, slices, maps, interfaces → `nil`

### Short Assignment Operator `:=` (Preferred)

```go
numCars := 10           // inferred as int
name := "Lane"          // inferred as string
pi := 3.14              // inferred as float64
pi2 := 2.0              // the `.0` makes it float64 (without it, `2` is int)
```

- `:=` declares **and** assigns.
- Still statically typed — the type is locked in at declaration.
- Used inside functions; cannot be used at package level.

### Multiple Variables on One Line

```go
averageOpenRate, displayMessage := 0.23, "is the average open rate"
```

### Constants

```go
const premiumPlanName = "Premium Plan"
const basicPlanName   = "Basic Plan"
```

- Use `const` keyword.
- Cannot use `:=` with constants.
- Value must be known **at compile time** (not computed at runtime).
- You **cannot reassign** a constant — doing so causes a compile error.
- Constants can be computed from other constants (the computation happens at compile time):

```go
const secondsInMinute = 60
const minutesInHour   = 60
const secondsInHour   = secondsInMinute * minutesInHour  // valid — both are compile-time known
```

---

## 6. String Formatting

Go uses the `fmt` package for string formatting. It is one of the weaknesses of the language (verbose compared to modern languages).

### Key Functions

| Function | Behavior |
|---|---|
| `fmt.Printf(template, args...)` | Prints formatted string to standard output |
| `fmt.Sprintf(template, args...)` | Returns formatted string (does NOT print) |
| `fmt.Println(args...)` | Prints with newline |

### Formatting Verbs

| Verb | Meaning |
|---|---|
| `%v` | Default format (works for any type) |
| `%s` | String |
| `%d` | Integer in decimal form |
| `%f` | Float |
| `%.2f` | Float with 2 decimal places |
| `%.1f` | Float with 1 decimal place |
| `%T` | Prints the **type** of the variable |

```go
name := "Lane"
age := 30
msg := fmt.Sprintf("I am %v years old", age)        // "I am 30 years old"
msg2 := fmt.Sprintf("Hi %s, you are %d", name, age) // "Hi Lane, you are 30"
msg3 := fmt.Sprintf("Cost: %.2f", 1.4)              // "Cost: 1.40"
```

---

## 7. Conditionals

### Basic `if` / `else if` / `else`

```go
if height > 6 {
    fmt.Println("You are super tall")
} else if height > 4 {
    fmt.Println("You are tall enough")
} else {
    fmt.Println("You are short")
}
```

- No parentheses around the condition (unlike C/Java/JavaScript).
- `else if` and `else` are optional.

### `if` with Initializer

A variable can be declared inline in the `if` statement. Its scope is **limited to the if block**:

```go
// Traditional way:
length := getLength(email)
if length < 1 {
    fmt.Println("Email is invalid")
}

// With initializer (scope limited):
if length := getLength(email); length < 1 {
    fmt.Println("Email is invalid")
}
// `length` is NOT accessible here
```

**Why use this?** Keeps scope narrow and signals the variable is only needed for this check.

### Guard Clauses / Early Returns

A **guard clause** returns early from a function when a certain condition is met. Modern Go style **strongly favors** guard clauses over deep nesting:

```go
// Bad: deeply nested
func getInsuranceAmount(status string) int {
    amount := 0
    if status == "gold" {
        if hasVehicle {
            amount = 100
        } else {
            amount = 50
        }
    } else {
        amount = 25
    }
    return amount
}

// Good: guard clauses (linear, readable)
func getInsuranceAmount(status string) int {
    if status != "gold" {
        return 25
    }
    if hasVehicle {
        return 100
    }
    return 50
}
```

Guard clauses provide a **linear approach to logic trees** — easier to read and reason about.

---

## 8. Functions

### Basic Function Syntax

```go
func subtract(x int, y int) int {
    return x - y
}
```

**Function signature** = everything before the `{`: `func subtract(x int, y int) int`  
The signature tells callers: what goes in, what comes out — without revealing implementation.

### Shorthand for Same-type Parameters

```go
// Both ways are valid, second is more concise:
func add(x int, y int) int { return x + y }
func add(x, y int) int     { return x + y }  // type on last param only
```

### Multiple Return Values

```go
func getPoint() (int, int) {
    return 3, 4
}

x, y := getPoint()
```

When a function returns multiple values, wrap return types in parentheses.

### Ignoring Return Values with `_`

Go does **not allow unused variables**. Use `_` to explicitly ignore a return value:

```go
x, _ := getPoint()  // y is ignored
```

The underscore is not a variable — the compiler completely discards it.

### Named Return Values

```go
func yearsUntilEvents(age int) (yearsUntilAdult, yearsUntilDrinking, yearsUntilCarRental int) {
    yearsUntilAdult = 18 - age
    if yearsUntilAdult < 0 {
        yearsUntilAdult = 0
    }
    yearsUntilDrinking = 21 - age
    if yearsUntilDrinking < 0 {
        yearsUntilDrinking = 0
    }
    yearsUntilCarRental = 25 - age
    if yearsUntilCarRental < 0 {
        yearsUntilCarRental = 0
    }
    return  // "naked return" — returns named values implicitly
}
```

**Named returns serve as built-in documentation** — callers can see what each value represents without reading the function body.

**Recommendation:**
- **Do** use named returns for documentation purposes (especially when returning multiple values of the same type).
- **Don't** use naked/implicit returns (the bare `return` without values) except in very short, simple functions — it harms readability.

### Pass by Value

Go passes variables **by value** (copies are made):

```go
func increment(x int) {
    x++  // modifies a LOCAL copy of x
}

x := 5
increment(x)
fmt.Println(x)  // still 5 — the original is unchanged
```

To modify the original, either return the new value or use a pointer (covered later).

### Functions as Values (First-Class Functions)

Functions can be stored in variables and passed around:

```go
func add(x, y int) int { return x + y }

func aggregate(a, b, c int, arithmetic func(int, int) int) int {
    return arithmetic(arithmetic(a, b), c)
}

result := aggregate(2, 3, 4, add)  // 9
```

The type of a function includes its signature: `func(int, int) int` is a distinct type from `func(int, int, int) int`.

---

## 9. Structs

### Defining and Using Structs

A **struct** is a collection of named, typed fields — like an object or dictionary:

```go
// Definition
type Car struct {
    Make   string
    Model  string
    Height int
    Width  int
}

// Instantiation (zero values)
var myCar Car

// Access with dot operator
myCar.Make = "Tesla"
myCar.Model = "Model 3"

// Struct literal
myCar2 := Car{Make: "Ford", Model: "F-150", Height: 70, Width: 80}
```

### Nested Structs

Structs can contain other structs as fields:

```go
type Wheel struct {
    Radius   int
    Material string
}

type Car struct {
    Make        string
    Model       string
    FrontWheel  Wheel
    BackWheel   Wheel
}

myCar := Car{}
myCar.FrontWheel.Radius = 5
```

### Anonymous Structs

A struct with no named type — useful when you only need one instance:

```go
myCar := struct {
    Make  string
    Model string
}{
    Make:  "Tesla",
    Model: "Model 3",
}
```

Use sparingly. **Prefer named structs** for reusability and clarity. One legitimate use: shaping a one-off JSON response in an HTTP handler.

### Embedded Structs

Embedding a struct copies all its fields to the top level of the outer struct (syntactic sugar — NOT inheritance):

```go
type Car struct {
    Make  string
    Model string
}

type Truck struct {
    Car        // embedded — NOT a named field
    BedSize int
}

lanesTruck := Truck{
    Car:     Car{Make: "Ford", Model: "F-150"},
    BedSize: 8,
}

// Fields are accessed at the TOP level:
fmt.Println(lanesTruck.Make)   // NOT lanesTruck.Car.Make
fmt.Println(lanesTruck.Model)  // NOT lanesTruck.Car.Model
fmt.Println(lanesTruck.BedSize)
```

**Real-world use case:** Separating public and private user fields; embedding private fields in public struct to null them out when sending to the frontend.

---

## 10. Methods on Structs

Methods are **functions attached to a type**. They use a special receiver parameter:

```go
type Rectangle struct {
    Width  float64
    Height float64
}

// Method with value receiver
func (r Rectangle) Area() float64 {
    return r.Width * r.Height
}

// Method with POINTER receiver (can mutate the struct)
func (r *Rectangle) Scale(factor float64) {
    r.Width *= factor
    r.Height *= factor
}

rect := Rectangle{Width: 5, Height: 10}
fmt.Println(rect.Area())    // 50
rect.Scale(2)
fmt.Println(rect.Width)     // 10 — mutation persisted
```

**Value receiver** → works on a copy; mutations do NOT persist.  
**Pointer receiver** → works on the original; mutations DO persist.

You can call a pointer-receiver method on a plain value — Go automatically takes the address:

```go
c := Circle{Radius: 5}
c.Grow()  // valid even though Grow has a *Circle receiver
```

**Best practice:** Pointer receivers are more commonly used. Use a value receiver only when you intentionally want to work on a copy.

---

## 11. Interfaces

### What is an Interface?

An interface defines a **set of method signatures** that a type must implement. Any type that implements all the methods of an interface automatically satisfies it — **no explicit declaration needed** (implicit interface satisfaction):

```go
type Shape interface {
    Area() float64
    Perimeter() float64
}

type Rectangle struct { Width, Height float64 }
func (r Rectangle) Area() float64      { return r.Width * r.Height }
func (r Rectangle) Perimeter() float64 { return 2*r.Width + 2*r.Height }

type Circle struct { Radius float64 }
func (c Circle) Area() float64      { return math.Pi * c.Radius * c.Radius }
func (c Circle) Perimeter() float64 { return 2 * math.Pi * c.Radius }

// Both Rectangle and Circle implement Shape — no `implements` keyword needed
func printArea(s Shape) {
    fmt.Println(s.Area())
}
printArea(Rectangle{5, 10})  // valid
printArea(Circle{7})          // also valid
```

### Implicit Interface Satisfaction

Unlike Java (`implements Shape` required), Go does this automatically. This:
1. Decouples interface definition from type definition.
2. Allows a type to implement many interfaces without extra boilerplate.
3. Allows third-party types to satisfy your interfaces without modifying them.

### Interface Best Practices

1. **Keep interfaces small.** 1–3 methods is ideal. The smaller the interface, the easier it is to satisfy and the more flexible it is.

   ```go
   // Good: tiny, powerful
   type Stringer interface {
       String() string
   }
   ```

2. **Don't make interfaces aware of the types that satisfy them.** For example, an `Animal` interface should NOT have `Isdog() bool` — that's awareness of underlying types.

3. **Interfaces are NOT classes.** They have no constructors, no inheritance hierarchy, and no implementation sharing. They only define a contract (method signatures), not behavior.

### Naming Interface Arguments

You can name the parameters in interface method signatures for documentation:

```go
// Less clear:
type Copier interface {
    Copy(string, string) int
}

// More clear:
type Copier interface {
    Copy(sourceFile, destinationFile string) (bytesCopied int)
}
```

Not required for compilation, but greatly improves readability.

### The Empty Interface

```go
interface{}   // or `any` in modern Go
```

An interface with zero methods — satisfied by **every type**. Useful for truly generic code (but overusing it loses type safety).

### Type Assertions

Cast an interface back to its underlying type:

```go
var s Shape = Circle{Radius: 5}

circle, ok := s.(Circle)
if ok {
    fmt.Println(circle.Radius)  // access Circle-specific fields
}
```

`ok` is `false` if `s` is not actually a `Circle`. If you do `circle := s.(Circle)` without `ok` and it's the wrong type, the program **panics**.

### Type Switches

Cleaner than successive type assertions:

```go
func getExpenseReport(e Expense) (string, float64) {
    switch v := e.(type) {
    case Email:
        return v.ToAddress, v.Cost()
    case SMS:
        return v.ToPhoneNumber, v.Cost()
    default:
        return "", 0.0
    }
}
```

---

## 12. Errors

### Go's Error Philosophy

Go does **not** use try/catch. Errors are **values**, not exceptions. This is a core Go philosophy.

```go
// JavaScript style (try/catch)
try {
    user = getUser()
    profile = getUserProfile(user.ID)
} catch(err) {
    handleError(err)
}

// Go style (errors as values)
user, err := getUser()
if err != nil {
    return err
}

profile, err := getUserProfile(user.ID)
if err != nil {
    return err
}
```

**Why Go's approach is better:**
1. Every dangerous function call is **explicitly visible** in the code — no hidden throws.
2. Function signatures include `error` return type, so you know a function can fail just by looking at its signature.
3. Forces you to handle each error individually.
4. No hidden scoping issues (variables in try blocks are accessible in catch blocks in JS — causing subtle bugs).

### The `error` Interface

```go
type error interface {
    Error() string
}
```

An error is just an interface with one method that returns a string description of what went wrong. `nil` means no error.

### Checking Errors

```go
result, err := someFunction()
if err != nil {
    // something went wrong
    fmt.Println(err.Error())
    return
}
// safe to use result
```

### Creating Errors with `errors.New`

```go
import "errors"

func divide(x, y float64) (float64, error) {
    if y == 0 {
        return 0.0, errors.New("no dividing by zero")
    }
    return x / y, nil
}
```

### Custom Error Types

Since `error` is an interface, you can create your own types that implement it, carrying structured data:

```go
type DivideError struct {
    Dividend float64
}

func (de DivideError) Error() string {
    return fmt.Sprintf("cannot divide %v by zero", de.Dividend)
}

func divide(dividend, divisor float64) (float64, error) {
    if divisor == 0 {
        return 0.0, DivideError{Dividend: dividend}
    }
    return dividend / divisor, nil
}
```

This lets you include contextual information (like which value caused the problem) in error messages.

### Error Formatting

```go
// Use fmt.Sprintf for error messages with dynamic content
func getSMSErrorString(cost float64, recipient int) string {
    return fmt.Sprintf("SMS that costs %.2f to be sent to %v cannot be sent", cost, recipient)
}
```

---

## 13. Loops

Go has **only one loop construct: `for`**. It covers all use cases (for, while, do-while).

### Standard `for` Loop

```go
for i := 0; i < 10; i++ {
    fmt.Println(i)
}
```

Three parts: **initializer**, **condition**, **post-statement** (all optional).

### `while`-style Loop (condition only)

```go
plantHeight := 1
for plantHeight < 5 {
    fmt.Println("Plant is growing...")
    plantHeight++
}
```

### Infinite Loop (no condition)

```go
for {
    // runs forever unless you break or return
}
```

Common in servers and background workers.

### `continue` and `break`

```go
for i := 0; i < 10; i++ {
    if i == 3 {
        continue  // skip to next iteration
    }
    if i == 7 {
        break     // exit the loop entirely
    }
    fmt.Println(i)
}
```

### `range` — Iterating Over Slices

```go
fruits := []string{"apple", "banana", "grape"}

for index, value := range fruits {
    fmt.Println(index, value)
}

// Ignore the index:
for _, value := range fruits {
    fmt.Println(value)
}
```

### Modulo Operator `%`

Returns the **remainder** after division:

```go
10 % 3   // 1 (3 goes into 10 three times; remainder is 1)
12 % 4   // 0 (4 divides evenly into 12)
16 % 5   // 1 (5 goes in 3 times = 15; remainder 1)
22 % 8   // 6 (8 goes in 2 times = 16; remainder 6)
```

**Common use: check if a number is even/odd:**
```go
if n % 2 == 0 {
    // n is even
}
```

**FizzBuzz example (correct order matters — check 3 AND 5 first):**
```go
for i := 1; i <= 100; i++ {
    if i%3 == 0 && i%5 == 0 {
        fmt.Println("FizzBuzz")
    } else if i%3 == 0 {
        fmt.Println("Fizz")
    } else if i%5 == 0 {
        fmt.Println("Buzz")
    } else {
        fmt.Println(i)
    }
}
```

---

## 14. Arrays & Slices

### Arrays (Fixed Size)

```go
// Type: [3]int — an array of 3 integers
var myNums [10]int                          // 10 zeros
primes := [6]int{2, 3, 5, 7, 11, 13}      // array literal
```

Arrays have a **fixed size** that is part of their type. `[3]int` and `[4]int` are different types. You almost never use arrays directly in Go — use slices instead.

### Slices (Dynamic Views into Arrays)

```go
// Type: []int — a slice of integers (no size in brackets)
mySlice := []int{1, 2, 3}
mySlice2 := make([]int, 5)      // slice of 5 zeros, capacity 5
mySlice3 := make([]int, 5, 10)  // length 5, capacity 10
```

**Slices are a view into an underlying array.** They have:
- **Length (`len`)**: How many elements are currently in the slice.
- **Capacity (`cap`)**: How many elements the underlying array can hold before a new one is allocated.

### Slicing an Array or Slice

```go
a := [5]int{1, 2, 3, 4, 5}
b := a[1:4]   // slice from index 1 up to (NOT including) 4 → [2, 3, 4]
c := a[:]     // entire array as a slice
```

### How Slices Work in Memory

Slices and arrays store elements in **contiguous memory**. When you grow a slice beyond its capacity:
1. Go allocates a new, larger underlying array (typically doubled).
2. Copies all existing elements over.
3. The slice now points to the new array.

This copying is the reason you should **pre-allocate slices** when you know the final size:

```go
// Inefficient — grows one-by-one, causing multiple copies:
var result []string
for _, s := range input {
    result = append(result, process(s))
}

// Efficient — pre-allocated:
result := make([]string, len(input))
for i, s := range input {
    result[i] = process(s)
}
```

### `append`

```go
mySlice = append(mySlice, newElement)         // append one
mySlice = append(mySlice, elem1, elem2)       // append multiple
mySlice = append(mySlice, anotherSlice...)    // spread operator
```

⚠️ **Always reassign back to the same slice variable.** Appending to a slice and saving into a DIFFERENT variable can lead to shared-array bugs:

```go
// WRONG — can cause bugs with shared underlying arrays
b := append(a, 4)

// CORRECT
a = append(a, 4)
```

### Slices are Reference Types

When you pass a slice into a function, the function can **modify the underlying array**. The caller sees those changes even if the function doesn't return the slice:

```go
func zeroOut(s []int) {
    for i := range s {
        s[i] = 0
    }
}

nums := []int{1, 2, 3}
zeroOut(nums)
fmt.Println(nums)  // [0 0 0] — modified!
```

### 2D Slices (Slice of Slices)

```go
matrix := [][]int{
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9},
}
fmt.Println(matrix[1][2])  // 6
```

### Variadic Functions

Receive any number of arguments of the same type as a slice:

```go
func sum(nums ...int) int {
    total := 0
    for _, n := range nums {
        total += n
    }
    return total
}

sum(1, 2, 3)           // nums is []int{1, 2, 3}
sum(nums...)           // spread a slice with ...
```

`fmt.Println` is variadic: `func Println(a ...interface{})`.

---

## 15. Maps

### What is a Map?

A map is an **associative data structure** (key-value pairs) — like a JavaScript object or Python dictionary. Lookups by key are instant (O(1)), unlike searching through a slice.

### Creating Maps

```go
// Using make:
ages := make(map[string]int)
ages["John"] = 37

// Map literal:
ages := map[string]int{
    "John": 37,
    "Alice": 25,
}
```

### Operations

```go
// Insert / update:
ages["Bob"] = 42

// Read:
age := ages["Bob"]  // 42

// Check existence:
age, ok := ages["Carol"]
if !ok {
    fmt.Println("Carol not found")
}

// Delete:
delete(ages, "Bob")

// Length:
fmt.Println(len(ages))
```

### Map Key Types

Map keys must be **comparable** (support `==`):
- ✅ Strings, numbers, booleans, structs (with comparable fields), arrays
- ❌ Slices, maps, functions (not comparable — they're references to memory)

### Maps are Reference Types

Like slices, maps are passed by reference. Mutations inside a function are visible outside:

```go
func addEntry(m map[string]int, key string, val int) {
    m[key] = val  // mutates the caller's map
}
```

### Nested Maps vs Struct Keys

You CAN nest maps:
```go
m := map[string]map[string]int{}
m["Alice"]["count"] = 5
```

But you must initialize inner maps before using them (or you'll panic). A cleaner alternative for multi-dimensional keys is using a **struct as a key**:

```go
type NameKey struct { First, Last string }
m := map[NameKey]int{}
m[NameKey{"Lane", "Wagner"}] = 42
```

### Accessing a Missing Key

Returns the **zero value** for the value type — does NOT panic:
```go
count := ages["Missing"]  // returns 0 (not an error)
```

Accessing a **nil map** WILL panic. Always initialize maps before using them.

---

## 16. Advanced Functions

### First-Class Functions

Functions are values in Go — they can be stored in variables, passed as arguments, returned from other functions.

```go
func add(x, y int) int { return x + y }

myFunc := add          // store function in variable
result := myFunc(3, 4) // call it — result is 7
```

### Higher-Order Functions

A function that accepts a function as a parameter or returns a function:

```go
func aggregate(a, b, c int, arithmetic func(int, int) int) int {
    return arithmetic(arithmetic(a, b), c)
}

sum := aggregate(2, 3, 4, func(x, y int) int { return x + y }) // 9
```

**Common real-world uses:**
- HTTP middleware
- Event handlers (onclick)
- Callbacks

### Anonymous Functions

Functions without a name, used inline:

```go
result := func(x, y int) int {
    return x + y
}(3, 4)  // immediately invoked

// Or passed as argument:
doMath(3, 4, func(x, y int) int { return x * y })
```

### Closures

A closure is a function that captures and references variables from its enclosing scope. The function retains access to (and can modify) those variables across calls:

```go
func adder() func(int) int {
    sum := 0
    return func(x int) int {
        sum += x   // `sum` is enclosed — shared across calls
        return sum
    }
}

add := adder()
add(5)   // 5
add(10)  // 15
add(2)   // 17
```

Each call to `adder()` creates an independent `sum` variable — different instances don't share state.

**Important:** A closure has a **mutable reference** to the enclosed variable, not a copy.

**Common bug to watch for:** Closures in loops capturing the loop variable by reference:
```go
funcs := []func(){}
for i := 0; i < 3; i++ {
    i := i  // shadow `i` to capture current value
    funcs = append(funcs, func() { fmt.Println(i) })
}
```

### Function Currying

A function that takes a function and returns a new, enhanced function:

```go
func selfMath(mathFunc func(int, int) int) func(int) int {
    return func(x int) int {
        return mathFunc(x, x)
    }
}

square := selfMath(func(x, y int) int { return x * y })
double := selfMath(func(x, y int) int { return x + y })

square(5)  // 25
double(5)  // 10
```

**Real-world use:** Middleware in HTTP servers — wrapping handlers with authentication, logging, etc.

### The `defer` Keyword

`defer` schedules a function call to run **just before the current function returns** — regardless of which return statement is hit:

```go
func copyFile(src, dst string) error {
    source, err := os.Open(src)
    if err != nil {
        return err
    }
    defer source.Close()  // will ALWAYS run when copyFile returns

    // ... rest of function
    if someCondition {
        return errors.New("something went wrong")
    }
    return nil
}
```

Without `defer`, you'd need `source.Close()` before every `return`. Defer is perfect for cleanup: file closes, mutex unlocks, connection closes.

---

## 17. Pointers

### What is a Pointer?

A pointer is a variable that stores a **memory address** rather than a value directly. Understanding pointers requires understanding memory:

```
Variable X = 5  →  stored at address 169 in RAM
Variable Y = X  →  stored at address 170 (a COPY of X's value)
Variable Z = &X →  stored at address 171 (holds the VALUE 169 = address of X)
```

`Z` is a pointer — it points TO `X`, not a copy of `X`.

### Pointer Syntax

```go
// Type of a pointer to int:
var p *int          // nil pointer (points to nothing)

// Create a pointer with &:
x := 5
ptr := &x           // ptr holds the address of x

// Dereference (follow the pointer) with *:
fmt.Println(*ptr)   // 5 — the value at the address
*ptr = 10           // modifies x through the pointer
fmt.Println(x)      // 10
```

| Operator | Context | Meaning |
|---|---|---|
| `*Type` | Type declaration | "pointer to Type" |
| `&variable` | Expression | "address of variable" |
| `*pointer` | Expression | "value at the address" (dereference) |

### Why Use Pointers?

**1. Modify a value inside a function (without returning it):**

```go
func increment(x *int) {
    *x++  // modifies the original
}

n := 5
increment(&n)
fmt.Println(n)  // 6
```

Without a pointer, `increment` would work on a copy and `n` would still be 5.

**2. Performance (avoid large copies):**  
If you have a giant struct and don't want to copy it every time you pass it to a function, use a pointer. (Only optimize this when needed — premature optimization leads to bugs.)

### Nil Pointer Danger

The zero value of a pointer is `nil`. Dereferencing a nil pointer causes a **panic** (runtime crash):

```go
var p *int
*p = 5  // PANIC: nil pointer dereference
```

Always check before dereferencing:

```go
if p != nil {
    *p = 5
}
```

### Pointer Receivers on Methods

Most methods use pointer receivers so they can mutate the struct:

```go
type Car struct { Color string }

// Value receiver — mutation does NOT persist
func (c Car) SetColorBad(color string) { c.Color = color }

// Pointer receiver — mutation PERSISTS
func (c *Car) SetColor(color string) { c.Color = color }

car := Car{Color: "white"}
car.SetColorBad("blue")
fmt.Println(car.Color)  // still "white"

car.SetColor("blue")
fmt.Println(car.Color)  // "blue" ✓
```

Go automatically handles taking the address when you call a pointer-receiver method on a value.

---

## 18. Packages & Modules

### Packages

Every `.go` file belongs to a package. The package name is declared at the top:

```go
package main  // executable program
package mystrings  // library package
```

**`package main`** is special:
- It's the entry point to executable programs.
- Must contain a `func main()`.
- Cannot be imported by other packages.
- Do NOT export (capitalize) function names in `main` — there's no reason to.

**Library packages** (any name other than `main`):
- Exported by capitalizing the first letter of function/type/variable names.
- Imported by other packages using the import path.
- No `main` function.

```go
// Exported (accessible outside package):
func Reverse(s string) string { ... }

// Unexported (internal use only):
func helper(s string) string { ... }
```

**Rule:** Export as little as possible. Every exported symbol is part of your public API — once exported, removing it breaks other people's code.

### Import Paths

```go
import (
    "fmt"                           // standard library
    "math/rand"                     // standard library sub-package
    "github.com/wagslane/go-rss"    // third-party (matches GitHub URL)
)
```

- Standard library packages have no URL prefix.
- Third-party packages use their remote URL as import path.
- Package name = last segment of import path (by convention): `github.com/wagslane/parser` → package name `parser`.

### Modules

A **module** is a collection of packages released together. Defined by a `go.mod` file:

```
module github.com/wagslane/myapp

go 1.20

require (
    github.com/wagslane/go-rabbitmq v0.10.0
)
```

**One repository → one module** (typical, though not required).

### `go mod init`

```bash
mkdir myapp && cd myapp
go mod init github.com/yourusername/myapp
# Creates go.mod
```

### `go get` — Adding Dependencies

```bash
go get github.com/wagslane/go-tinytime
# Downloads the package, adds it to go.mod and go.sum
```

### `go.sum`

Automatically maintained lock file with checksums for all dependencies. Ensures reproducible builds.

### Package Visibility: Directories = Packages

In Go, **a directory = a package**. All `.go` files in the same directory share the same package. You don't import/export between files in the same directory — they're all in the same package already.

---

## 19. Local Development Setup

### Prerequisites

1. **Editor:** VS Code with the official Go extension (syntax highlighting, autocomplete, etc.)
2. **Terminal:** macOS/Linux use built-in terminal. Windows: install Ubuntu in WSL2.
3. **Go toolchain:** Install from [go.dev/dl](https://go.dev/dl) or via GVM.

Verify installation:
```bash
go version
# go version go1.20 darwin/amd64
```

### Key Go Commands

| Command | Description |
|---|---|
| `go version` | Print installed Go version |
| `go run main.go` | Compile + run immediately (no binary saved; dev only) |
| `go build` | Compile current package → binary (production-ready) |
| `go install` | Compile + install binary globally (useful for personal scripts) |
| `go mod init <path>` | Initialize a new module |
| `go get <package>` | Download and add a dependency |
| `go mod tidy` | Add missing and remove unused dependencies |
| `go help <command>` | Show help for a command |

### Running Compiled Code

```bash
go build                      # builds ./myapp (binary named after directory)
./myapp                       # run it

# One-liner for rebuild + run:
go build && ./myapp
```

### The Go PATH (Legacy — Ignore It)

Old articles (pre Go 1.13) require putting code in `$GOPATH`. Modern Go (1.13+) uses modules instead. **You can put your code anywhere.** Ignore `$GOPATH`.

### Local Package Development (Replace Directive)

When developing a library locally (not yet published to GitHub), use a `replace` directive in `go.mod`:

```
module github.com/username/myapp

go 1.20

require github.com/username/mystrings v0.0.0

replace github.com/username/mystrings => ../mystrings
```

This tells Go to find `mystrings` on your local filesystem rather than downloading it. **Only for local development** — remove before publishing.

---

## 20. Concurrency — Goroutines & WaitGroups

### Why Concurrency?

Modern CPUs have multiple cores. Sequential code only uses one core. Concurrent code can distribute work across all cores for huge speedups.

**Sequential:** Instructions run one at a time, top to bottom.  
**Concurrent/Parallel:** Multiple instructions run at the same time on different CPU cores.

Not all code can be parallelized — only code whose parts don't depend on each other.

### Goroutines

The `go` keyword spawns a **goroutine** — a lightweight concurrent thread of execution:

```go
go doSomething()   // starts doSomething() in a new goroutine
// execution immediately continues here — doesn't wait
```

- Very cheap to create (unlike OS threads).
- Go's scheduler manages goroutines across available CPU cores.
- You CANNOT capture return values from goroutines directly.

```go
func sendEmail(message string) {
    go func() {              // anonymous function as goroutine
        time.Sleep(250 * time.Millisecond)
        fmt.Println("email received:", message)
    }()
    fmt.Println("email sent:", message)
}
```

Output: `email sent: ...` then (250ms later) `email received: ...`

### Channels

Channels are the primary way goroutines **communicate and synchronize**:

```go
ch := make(chan int)   // unbuffered channel of ints

// Send (blocks until someone receives):
go func() { ch <- 42 }()

// Receive (blocks until something is sent):
val := <-ch
fmt.Println(val)  // 42
```

**Buffered channels** don't block until full:
```go
ch := make(chan int, 10)  // buffer of 10 — send doesn't block until 10 items queued
```

### `sync.WaitGroup`

Used to wait for a collection of goroutines to finish:

```go
import "sync"

var wg sync.WaitGroup

for _, feed := range feeds {
    wg.Add(1)             // increment counter
    go func(f Feed) {
        defer wg.Done()   // decrement when done
        scrapeFeed(f)
    }(feed)
}

wg.Wait()  // block until counter reaches 0
```

- `wg.Add(n)` — add `n` to the counter (call before spawning the goroutine).
- `wg.Done()` — decrement by 1 (call when goroutine finishes; use `defer`).
- `wg.Wait()` — block until counter reaches 0.

### `time.Ticker`

Send a value on a channel at regular intervals:

```go
ticker := time.NewTicker(1 * time.Minute)
for {
    // First iteration executes immediately (no blocking on first pass):
    scrapeFeeds()
    <-ticker.C  // wait for next tick
}
```

Or using range:
```go
for range ticker.C {
    scrapeFeeds()
}
```

---

## 21. Channels

### Channel Direction

Channels can be restricted to send-only or receive-only in function signatures:

```go
func sendData(ch chan<- int) {   // send-only
    ch <- 42
}

func receiveData(ch <-chan int) { // receive-only
    val := <-ch
    fmt.Println(val)
}
```

### Closing Channels

```go
close(ch)
```

After closing, receives return the zero value immediately. Use `v, ok := <-ch` to check if the channel is open:

```go
val, ok := <-ch
if !ok {
    fmt.Println("channel is closed")
}
```

### `select` Statement

Wait on multiple channel operations:

```go
select {
case msg1 := <-ch1:
    fmt.Println("received from ch1:", msg1)
case msg2 := <-ch2:
    fmt.Println("received from ch2:", msg2)
case <-time.After(1 * time.Second):
    fmt.Println("timeout!")
}
```

---

## 22. Project: RSS Aggregator

The course culminates in building a **production-ready REST API** that:
- Creates and manages users with API key authentication.
- Stores RSS feed URLs in a PostgreSQL database.
- Lets users follow specific feeds.
- Runs a **background scraper** (using goroutines + WaitGroups) that periodically fetches new posts from all RSS feeds.
- Returns a personalized feed of posts for each user.

### Tech Stack

| Tool | Purpose |
|---|---|
| Go | Server language |
| PostgreSQL | Database |
| `chi` router | HTTP routing |
| `sqlc` | Type-safe SQL → Go code generator |
| `goose` | Database migration tool |
| `encoding/xml` | XML parsing for RSS feeds |
| `database/sql` | Database connection |
| `sync.WaitGroup` | Goroutine synchronization |

### Project Structure

```
rssagg/
├── go.mod
├── go.sum
├── main.go                    # entry point, server setup
├── handler_users.go           # user CRUD handlers
├── handler_feeds.go           # feed CRUD handlers
├── handler_feed_follows.go    # feed follow handlers
├── handler_posts.go           # posts for user handler
├── middleware_auth.go         # API key authentication middleware
├── models.go                  # Go struct ↔ DB struct conversions
├── rss.go                     # RSS XML parsing
├── scraper.go                 # background scraper
├── json.go                    # JSON response helpers
└── sql/
    ├── schema/                # goose migrations
    │   ├── 001_users.sql
    │   ├── 002_users_apikey.sql
    │   ├── 003_feeds.sql
    │   ├── 004_feed_follows.sql
    │   ├── 005_feeds_lastfetched.sql
    │   └── 006_posts.sql
    └── queries/               # sqlc SQL queries
        ├── users.sql
        ├── feeds.sql
        ├── feed_follows.sql
        └── posts.sql
```

### Database Schema Overview

#### `users` Table
```sql
CREATE TABLE users (
    id         UUID PRIMARY KEY,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    name       TEXT NOT NULL,
    api_key    VARCHAR(64) UNIQUE NOT NULL DEFAULT (encode(sha256(random()::text::bytea), 'hex'))
);
```

#### `feeds` Table
```sql
CREATE TABLE feeds (
    id             UUID PRIMARY KEY,
    created_at     TIMESTAMP NOT NULL,
    updated_at     TIMESTAMP NOT NULL,
    name           TEXT NOT NULL,
    url            TEXT UNIQUE NOT NULL,
    user_id        UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    last_fetched_at TIMESTAMP
);
```

#### `feed_follows` Table
```sql
CREATE TABLE feed_follows (
    id         UUID PRIMARY KEY,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    user_id    UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    feed_id    UUID NOT NULL REFERENCES feeds(id) ON DELETE CASCADE,
    UNIQUE(user_id, feed_id)   -- can't follow same feed twice
);
```

#### `posts` Table
```sql
CREATE TABLE posts (
    id           UUID PRIMARY KEY,
    created_at   TIMESTAMP NOT NULL,
    updated_at   TIMESTAMP NOT NULL,
    title        TEXT,
    description  TEXT,
    published_at TIMESTAMP NOT NULL,
    url          TEXT UNIQUE NOT NULL,   -- prevents duplicate posts
    feed_id      UUID NOT NULL REFERENCES feeds(id) ON DELETE CASCADE
);
```

### API Authentication — API Key Middleware

Every authenticated endpoint passes through middleware that:
1. Reads the `Authorization: ApiKey <key>` header.
2. Looks up the user in the database by API key.
3. Attaches the user to the request context.
4. Returns 401 if key is missing or invalid.

```go
type authedHandler func(http.ResponseWriter, *http.Request, database.User)

func (cfg *apiConfig) middlewareAuth(handler authedHandler) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        apiKey, err := auth.GetAPIKey(r.Header)
        if err != nil {
            respondWithError(w, 403, "Couldn't get API key")
            return
        }
        user, err := cfg.DB.GetUserByAPIKey(r.Context(), apiKey)
        if err != nil {
            respondWithError(w, 400, "Couldn't get user")
            return
        }
        handler(w, r, user)
    }
}
```

### RSS Parsing

RSS is XML. Go's `encoding/xml` package unmarshals XML into Go structs:

```go
type RSSFeed struct {
    Channel struct {
        Title       string    `xml:"title"`
        Link        string    `xml:"link"`
        Description string    `xml:"description"`
        Items       []RSSItem `xml:"item"`
    } `xml:"channel"`
}

type RSSItem struct {
    Title       string `xml:"title"`
    Link        string `xml:"link"`
    Description string `xml:"description"`
    PubDate     string `xml:"pubDate"`
}

func urlToFeed(url string) (RSSFeed, error) {
    client := &http.Client{Timeout: 10 * time.Second}
    resp, err := client.Get(url)
    if err != nil {
        return RSSFeed{}, err
    }
    defer resp.Body.Close()

    data, err := io.ReadAll(resp.Body)
    if err != nil {
        return RSSFeed{}, err
    }

    var rssFeed RSSFeed
    err = xml.Unmarshal(data, &rssFeed)
    return rssFeed, err
}
```

### Background Scraper

The scraper runs as a **long-lived goroutine** on a ticker:

```go
func startScraping(db *database.Queries, concurrency int, timeBetweenRequests time.Duration) {
    log.Printf("Scraping on %v goroutines every %s duration", concurrency, timeBetweenRequests)

    ticker := time.NewTicker(timeBetweenRequests)
    for ; ; <-ticker.C {  // semicolons = run immediately, then wait
        feeds, err := db.GetNextFeedsToFetch(context.Background(), int32(concurrency))
        if err != nil {
            log.Println("Couldn't get next feeds to fetch:", err)
            continue
        }

        var wg sync.WaitGroup
        for _, feed := range feeds {
            wg.Add(1)
            go scrapeFeed(db, &wg, feed)
        }
        wg.Wait()
    }
}

func scrapeFeed(db *database.Queries, wg *sync.WaitGroup, feed database.Feed) {
    defer wg.Done()

    _, err := db.MarkFeedFetched(context.Background(), feed.ID)
    if err != nil {
        log.Printf("Couldn't mark feed %s fetched: %v", feed.Name, err)
        return
    }

    rssFeed, err := urlToFeed(feed.Url)
    if err != nil {
        log.Printf("Couldn't collect feed %s: %v", feed.Name, err)
        return
    }

    for _, item := range rssFeed.Channel.Items {
        pubAt, err := time.Parse(time.RFC1123Z, item.PubDate)
        if err != nil {
            log.Printf("Couldn't parse date %v: %v", item.PubDate, err)
            continue
        }

        _, err = db.CreatePost(context.Background(), database.CreatePostParams{
            ID:          uuid.New(),
            CreatedAt:   time.Now().UTC(),
            UpdatedAt:   time.Now().UTC(),
            Title:       sql.NullString{String: item.Title, Valid: item.Title != ""},
            Description: sql.NullString{String: item.Description, Valid: item.Description != ""},
            PublishedAt: pubAt,
            Url:         item.Link,
            FeedID:      feed.ID,
        })
        if err != nil && !strings.Contains(err.Error(), "duplicate key") {
            log.Printf("Couldn't create post: %v", err)
        }
    }
    log.Printf("Feed %s collected, %v posts found", feed.Name, len(rssFeed.Channel.Items))
}
```

### Key Design Patterns Used

1. **Middleware pattern** — Authentication injected via curried handler functions.
2. **Repository pattern** — `sqlc` generates type-safe database access code from SQL queries.
3. **Background worker** — Scraper goroutine with ticker and WaitGroup.
4. **Error propagation** — Every function that can fail returns `(result, error)`.
5. **Guard clauses** — Every handler validates input and returns early on error.
6. **Duplicate key handling** — When re-scraping, duplicate posts silently skipped.
7. **ON DELETE CASCADE** — Database-level referential integrity (deleting a feed removes all its posts and follows automatically).

### HTTP Endpoints

| Method | Path | Auth | Description |
|---|---|---|---|
| `POST` | `/v1/users` | No | Create user |
| `GET` | `/v1/users` | Yes | Get current user |
| `POST` | `/v1/feeds` | Yes | Create a feed |
| `GET` | `/v1/feeds` | No | List all feeds |
| `POST` | `/v1/feed_follows` | Yes | Follow a feed |
| `GET` | `/v1/feed_follows` | Yes | Get user's followed feeds |
| `DELETE` | `/v1/feed_follows/{feedFollowID}` | Yes | Unfollow a feed |
| `GET` | `/v1/posts` | Yes | Get posts from followed feeds |

### Starting the Server

```go
func main() {
    // Load env, connect DB
    db := database.New(dbConn)
    cfg := &apiConfig{DB: db}

    // Start background scraper (as goroutine)
    go startScraping(db, 10, time.Minute)

    // Set up router
    router := chi.NewRouter()
    router.Use(cors.Handler(cors.Options{...}))

    v1Router := chi.NewRouter()
    v1Router.Post("/users", cfg.handlerCreateUser)
    v1Router.Get("/users", cfg.middlewareAuth(cfg.handlerGetUser))
    // ... more routes

    router.Mount("/v1", v1Router)

    srv := &http.Server{Addr: ":" + port, Handler: router}
    log.Printf("Serving on port: %s\n", port)
    log.Fatal(srv.ListenAndServe())
}
```

---

## Quick Reference Cheat Sheet

### Variable Declaration

```go
var x int = 5         // explicit type + value
var x int             // zero value
x := 5                // short (inferred type)
const y = 10          // immutable, compile-time value
```

### Function

```go
func name(param1 type1, param2 type2) (returnType1, returnType2) {
    return val1, val2
}
```

### Struct

```go
type Name struct { Field1 Type1; Field2 Type2 }
instance := Name{Field1: val1, Field2: val2}
instance.Field1
```

### Interface

```go
type MyInterface interface { Method() ReturnType }
// Any type with Method() satisfies it automatically
```

### Error Handling

```go
result, err := dangerousFunc()
if err != nil {
    return fmt.Errorf("context: %w", err)
}
```

### Goroutine + WaitGroup

```go
var wg sync.WaitGroup
for _, item := range items {
    wg.Add(1)
    go func(i Item) {
        defer wg.Done()
        process(i)
    }(item)
}
wg.Wait()
```

### Channel

```go
ch := make(chan int)
go func() { ch <- 42 }()
val := <-ch
```

### Slice Operations

```go
s := []int{1, 2, 3}
s = append(s, 4)
for i, v := range s { ... }
sub := s[1:3]   // [2, 3]
```

### Map Operations

```go
m := map[string]int{"a": 1}
m["b"] = 2
val, ok := m["c"]
delete(m, "a")
```

### Defer

```go
func f() {
    defer cleanup()  // runs when f returns
    // ... work
}
```

---

*Notes compiled from the full video transcript of the Go Programming / Golang Course with Bonus Projects (FreeCodeCamp / Boot.dev). Instructors: Lane Wagner & Alan Lers.*
