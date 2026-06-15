We can know value of trignometric fumction like sin cos tan

--[[
print(math.sin(30))
print(math.cos(60))
]]

--you will see "unexpected" results ie.(-0.98803162409286 , -0.95241298041516) because Lua (like most programming languages) expects trigonometric functions to receive input in Radians, not Degrees.
-- To correct , use :


local degree = 30
local radian = degree * (math.pi/180)
print(math.sin(radian))
print(math.cos(radian))
print(math.tan(radian))
--Lua does not have built-in functions for cot, sec, or cosec . So we use :
print(1 / math.tan(radian))
print(1 / math.cos(radian))
print(1 / math.sin(radian))



