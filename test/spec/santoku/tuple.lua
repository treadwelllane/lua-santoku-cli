local assert = require("luassert")
local test = require("santoku.test")

local tup = require("santoku.tuple")

test("tuple", function ()

  test("stores varargs", function ()

    local tup, m = tup(1, 2, 3)
    assert(m == 3)

    local a, b, c = tup()
    assert.equals(1, a)
    assert.equals(2, b)
    assert.equals(3, c)

  end)

  test("allows append", function ()

    local tup, m = tup(1)
    assert(m == 1)

    local a, b, c = tup(2, 3)
    assert.equals(1, a)
    assert.equals(2, b)
    assert.equals(3, c)

  end)

  test("allows map", function ()

    local a, b, c = tup.map(function (a) return a * 2 end, 1, 2, 3)
    assert.equals(2, a)
    assert.equals(4, b)
    assert.equals(6, c)

  end)

  test("interleave", function ()

    local a, b, c, d, e = tup.interleave(5, 1, 2, 3)
    assert.same({ 1, 5, 2, 5, 3 }, { a, b, c, d, e })

  end)

end)
