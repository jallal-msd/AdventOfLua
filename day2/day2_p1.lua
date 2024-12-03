file = io.open("input1.txt")
io.input(file)

safe = 0
level = ""
compare = 0
for str in file:lines() do
	for word in string.gmatch(str, "%S+") do
		if compare == 0 then
			compare = tonumber(word)
		elseif compare < tonumber(word) and tonumber(word) - compare <= 3 and level ~= "down" then
			level = "up"
			compare = tonumber(word)
		elseif compare > tonumber(word) and compare - tonumber(word) <= 3 and level ~= "up" then
			level = "down"
			compare = tonumber(word)
		else
			compare = 0
			break
		end
	end
	if compare ~= 0 then
		safe = safe + 1
	end
	compare = 0
	level = ""
end
print(safe)
