-- テスト時に plenary とこのプラグイン自体を runtimepath に追加する
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/plenary.nvim")
vim.opt.rtp:prepend(vim.fn.getcwd())
vim.cmd("runtime plugin/plenary.vim")
