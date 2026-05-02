if vim.g.loaded_yank_as_codeblock then return end
vim.g.loaded_yank_as_codeblock = true

vim.api.nvim_create_user_command("YankAsCodeBlock", function()
  require("yank-as-codeblock").yank()
end, {
  range = true,
  desc = "選択範囲を Markdown コードブロック形式でクリップボードへヤンクする",
})
