# wpm.nvim
## prints wpm when you leave insert mode
for vim-plug: 
```
Plug 'DuckDood/wpm.nvim'
```
for the others idk i havent used them

copy this into your config
```
require("wpm").setup()
```
also if you want to make it say a specific thing rather than just `{calculated wpm} WPM`, you can put a field called label in a table in setup and it will use that instead, e.g. `{label = ' wpm'}` will print `{calculated wpm} wpm`
