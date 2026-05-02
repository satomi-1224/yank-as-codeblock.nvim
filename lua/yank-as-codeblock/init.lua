local format = require("yank-as-codeblock.format")

local M = {}

---ビジュアル選択範囲を取得して、選択されたテキストと行範囲を返す。
---ビジュアルモードの "<" ">" マーク (visual line range) を使う。
---@return string content
---@return integer lstart
---@return integer lend
local function get_visual_selection()
  local lstart = vim.fn.line("'<")
  local lend = vim.fn.line("'>")
  local lines = vim.api.nvim_buf_get_lines(0, lstart - 1, lend, false)
  return table.concat(lines, "\n"), lstart, lend
end

---ビジュアル選択範囲を Markdown コードブロック形式でクリップボードへ書き込む。
function M.yank()
  local content, lstart, lend = get_visual_selection()
  local text = format({
    content = content,
    path = vim.fn.expand("%:."),
    lang = vim.bo.filetype,
    lstart = lstart,
    lend = lend,
  })
  vim.fn.setreg("+", text)
end

return M
