# yank-as-codeblock.nvim

![CI](https://github.com/satomi-1224/yank-as-codeblock.nvim/actions/workflows/test.yml/badge.svg)

選択範囲を「ファイルパス + 行番号 + 言語タグ + コード」の Markdown コードフェンス形式に整形してシステムクリップボードへヤンクする Neovim プラグイン。

**出力例:**

````
src/app.py:10-20
```python
def foo():
    pass
```
````

## 必要環境

- Neovim 0.10+

## インストール

### lazy.nvim

```lua
{
  "satomi-1224/yank-as-codeblock.nvim",
  keys = {
    { "<leader>yc", ":YankAsCodeBlock<CR>", mode = "v",
      desc = "選択範囲を Markdown コードブロックでヤンク" },
  },
}
```

### packer.nvim

```lua
use "satomi-1224/yank-as-codeblock.nvim"
```

### vim-plug

```vim
Plug 'satomi-1224/yank-as-codeblock.nvim'
```

## 使い方

ビジュアルモードで範囲を選択して `:YankAsCodeBlock` を実行する。
キーマップを設定している場合は `<leader>yc` でも起動できる。

クリップボードに以下の形式で整形されたテキストが入る:

````
{ファイルパス}:{行番号}
```{filetype}
{選択したコード}
```
````

## 開発

```sh
make test
```

[plenary.nvim](https://github.com/nvim-lua/plenary.nvim) の `PlenaryBustedDirectory` でテストを実行する。
