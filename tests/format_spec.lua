local format = require("yank-as-codeblock.format")

describe("format", function()
  it("単一行: path:行番号 + コードフェンスで整形する", function()
    local got = format({
      content = "print('hello')",
      path = "src/app.py",
      lang = "python",
      lstart = 10,
      lend = 10,
    })
    local want = table.concat({
      "src/app.py:10",
      "```python",
      "print('hello')",
      "```",
    }, "\n")
    assert.are.same(want, got)
  end)

  it("複数行: path:開始-終了 で行範囲を表記する", function()
    local got = format({
      content = "def foo():\n    pass",
      path = "src/app.py",
      lang = "python",
      lstart = 10,
      lend = 11,
    })
    local want = table.concat({
      "src/app.py:10-11",
      "```python",
      "def foo():",
      "    pass",
      "```",
    }, "\n")
    assert.are.same(want, got)
  end)

  it("filetype が空: 言語タグなしのコードフェンスにする", function()
    local got = format({
      content = "no syntax",
      path = "notes.txt",
      lang = "",
      lstart = 1,
      lend = 1,
    })
    local want = table.concat({
      "notes.txt:1",
      "```",
      "no syntax",
      "```",
    }, "\n")
    assert.are.same(want, got)
  end)
end)
