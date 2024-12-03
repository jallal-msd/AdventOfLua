function part_1()
	file = io.open("input1.txt")

	io.input(file)
	res = 0
	words = {}
	left = {}
	right = {}
	for str in file:lines() do
		for word in string.gmatch(str, "%S+") do
			table.insert(words, word)
		end
	end

	for i, v in ipairs(words) do
		if i == 1 or i % 2 ~= 0 then
			table.insert(left, v)
		end
		if i == 2 or i % 2 == 0 then
			table.insert(right, v)
		end
	end
	table.sort(left)
	table.sort(right)

	for i, v in ipairs(left) do
		if left[i] <= right[i] then
			diff = right[i] - left[i]
		else
			diff = left[i] - right[i]
		end
		res = res + diff
	end

	print(res)
end
function part_2() end
