local test = require("santoku.test")
local assert = require("luassert")

local fs = require("santoku.fs")
local vec = require("santoku.vector")
local fun = require("santoku.fun")
local op = require("santoku.op")

test("santoku.fs", function ()

  test("lines", function ()

    test("should return the correct number of lines", function ()

      local fp = "./spec/santoku/fs.tst1.txt"
      local ok, gen = fs.lines(fp)
      assert(ok)

      local a, b, c, d = gen:unpack()

      assert.equals("line 1", a)
      assert.equals("line 2", b)
      assert.equals("line 3", c)
      assert.equals("line 4", d)

    end)

  end)

  test("joinwith", function ()

    test("should handle nils", function ()

      local delim = "/"
      local result = fs.joinwith(delim, nil, "a", nil, "b")

      assert.equals("a/b", result)

    end)


  end)

  test("dirname", function ()

    test("should return the directory name", function ()

      local p0 = "/opt/bin/sort"
      assert.equals("/opt/bin", fs.dirname(p0))

      local p1 = "stdio.h"
      assert.equals(".", fs.dirname(p1))

      local p2 = "../../test"
      assert.equals("../..", fs.dirname(p2))

    end)

  end)

  test("basename", function ()

    test("should return the file name without directories", function ()

      local p0 = "/opt/bin/sort"
      assert.equals("sort", fs.basename(p0))

      local p1 = "stdio.h"
      assert.equals("stdio.h", fs.basename(p1))

    end)

  end)

  test("files", function ()

    test("should list directory files", function ()
      local files = vec(
        "spec/santoku/fs/a/a.txt",
        "spec/santoku/fs/b/a.txt",
        "spec/santoku/fs/a/b.txt",
        "spec/santoku/fs/b/b.txt")
      local i = 0
      fs.files("spec/santoku/fs", { recurse = true })
        :each(function (ok, fp, mode)
          assert(ok)
          assert(files:find(fun.narg()(op.eq, fp)))
          assert(mode == "file")
          i = i + 1
        end)
        assert(i == 4)
    end)

  end)

  test("splitexts", function ()

    test("should split a path into namme and extensions", function ()

      local p0 = "/opt/bin/sort.sh"
      assert.same({ name = "/opt/bin/sort", exts = { ".sh", n = 1} }, fs.splitexts(p0))

      local p1 = "stdio.tar.gz"
      assert.same({ name = "stdio", exts = { ".tar", ".gz", n = 2 } }, fs.splitexts(p1))

    end)

  end)

  test("absolute", function ()

    -- TODO: How can we make this test work
    -- regardless of where it's run? Do we run
    -- it in a chroot?
    test("should return the abolute path of a file", function ()

      -- local path = "/test.txt"
      -- print(fs.absolute(path))

    end)

  end)

end)
