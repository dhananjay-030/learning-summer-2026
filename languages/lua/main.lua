--[=[ 

local a = 12
local b = true
local c = false
local d = nil 
local e = [[this
is
	 a
	 multi
line variable]]
local f = " "
local g = -1
local h = 0
local i = hi
print("value of i :" .. tostring(i))
print("value of hi :" .. tostring(hi))
local j = "this"
local hi = 20
print("value of i :" .. tostring(i))
print("value of hi :" .. tostring(hi))
local hi = i
print("value of i :" .. tostring(i))
print("value of hi :" .. tostring(hi))
local changing_variable = i
local final = a .. f .. tostring(changing_variable)
print(final)

]=]

--[=[ 

local a = 12
local b = true
local c = false
local d = nil 
local e = [[this 
is 
	 a 
	 multi
line variable]]
local f = " "
local g = -1
local h = 0
local i = hi
print("value of i :" .. tostring(i))
print("value of hi :" .. tostring(hi))
local j = "this"
local i = 10
local hi = 20
print("value of i :" .. tostring(i))
print("value of hi :" .. tostring(hi))
local hi = i
print("value of i :" .. tostring(i))
print("value of hi :" .. tostring(hi))
local changing_variable = i
local final = a .. f .. tostring(changing_variable)
print(final)

]=]

--[=[
local a = 12
local b = true
local c = false
local d = nil
local e = [[this
is
	 a
	 multi
line variable]]
local f = " "
local g = -1
local h = 0
local i = hi
local j = "hi"
local k = j
print(k, type(k))
]=]





----------------------------------------------------------------------------





--[[
# Basic Calculator

local a = 16
local b = 5
local sum = a + b
local subs = a - b
local multi = a * b
local divide_quotient = a / b
local divide_reminder = a % b
local a_to_the_power_b = a ^ b
print("The sum of "..a.." and "..b.." is "..sum.." .")
print(a .. " minus " .. b .. " is " .. subs .. " .")
print(a.." times "..b.." is "..multi.." .")
print("When " .. a .. " is divided by " .. b .. ", we get " .. math.floor(divide_quotient) .. " as quotient and " .. divide_reminder .. " as reminder. The decimal value of the quotient is " .. divide_quotient .. " ." )
print(a .. " to the power " .. b .. " is " .. a_to_the_power_b .. " ." )
]]




---------------------------------------------------------------------------------



--[[
#Trignometric fumctions

We can also know value of trignometric fumction like sin cos tan
]]

--[[
print(math.sin(30))
print(math.cos(60))
]]

--you will see "unexpected" results (-0.98803162409286 , -0.95241298041516) because Lua (like most programming languages) expects trigonometric functions to receive input in Radians, not Degrees.
-- To correct , use :

--[[
local degree = 30
local radian = degree * (math.pi/180)
print(math.sin(radian))
print(math.cos(radian))
print(math.tan(radian))
print(1 / math.tan(radian))
print(1 / math.cos(radian))
print(1 / math.sin(radian))
]]
--Lua does not have built-in functions for cot, sec, or csc



-----------------------------------------------------------------------------






