local lu = require("luaunit")

function testNonSenseToTest()
	lu.assertEquals(1, 1)
end

os.exit(lu.LuaUnit.run())
