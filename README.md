# yank-as-codeblock.nvim

選択範囲を「ファイルパス + 行番号 + 言語タグ + コード」の Markdown コードフェンス
形式に整形してシステムクリップボードへヤンクする Neovim プラグイン。

```
src/app.py:10-20
```python
def foo():
    pass
```
```

## 必要環境

- Neovim 0.10+
- `unnamedplus` クリップボード対応 (macOS/Linux/Windows いずれも標準で OK)

## インストール

### lazy.nvim

ローカル開発用 (本リポジトリ):

```lua
{
  dir = "~/Work/yank-as-codeblock.nvim",
  keys = {
    { "<leader>yc", ":YankAsCodeBlock<CR>", mode = "v",
      desc = "選択範囲を Markdown コードブロックでヤンク" },
  },
}
```

## 使い方

ビジュアル選択して `:YankAsCodeBlock`、または上記の `<leader>yc` を押す。
クリップボードに整形済みテキストが入る。

## 開発

```sh
make test
```

`plenary.nvim` の `PlenaryBustedDirectory` でテストを実行する。
