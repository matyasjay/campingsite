local lu = require("luaunit")

function TestNonSenseToTest()
	lu.assertEquals(1, 1)
end

os.exit(lu.LuaUnit.run())
