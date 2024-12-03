file = io.open("input2.txt")

io.input(file)

res = 0
total = 0
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
	total = 0
	for j, k in ipairs(right) do
		if left[i] == right[j] then
			print("left: ", left[i], "right:", right[j])

			total = total + 1
			print("total:", total)
		end
	end
	times = total * left[i]
	res = res + times
end
print(res)
