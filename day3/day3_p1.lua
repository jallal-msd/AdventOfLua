file = io.open("input1.txt")
io.input(file)

valid = {}
for str in file:lines() do
	for val in string.gmatch(str, "mul%(%d+,%d+%)") do
		table.insert(valid, val)
	end
end
sum = 0
mult = 1

for i, v in ipairs(valid) do
	for val in string.gmatch(v, "%d+") do
		mult = mult * tonumber(val)
	end
	sum = sum + mult
	mult = 1
end

print(sum)
