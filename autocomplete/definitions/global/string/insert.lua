return {
	type = "function",
	description = [[Returns a string where one string has been inserted into another, after a specified position.
		
	For example, `string.insert("12345678", "abcdefgh", 5)` will return `"12345abcdefgh678"`.]],
	arguments = {
		{ name = "s1", type = "string", description = "The string to insert into." },
		{ name = "s2", type = "string", description = "The string to insert." },
		{ name = "position", type = "number", description = "The position to insert s2 into s1." },
	},
	returns = {
		{ name = "inserted", type = "string", description = "A copy of `s1`, with `s2` inserted into it." },
	}
}