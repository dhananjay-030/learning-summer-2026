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
