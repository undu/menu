[![Slack Room][slack-badge]][slack-link]

# Menu

**Menu** is a fish library to create interactive prompt menus.

## Install

With [fisherman]

```
fisher menu
```

<img width="40%" src="https://cloud.githubusercontent.com/assets/8317250/14820969/d6d40c38-0c03-11e6-851e-6a927f7b9d3e.gif">

## Usage

```
menu 1 2 3
> 1  
  2
  3
```

## Options

### `menu_cursor_glyph`

Set cursor character. Default: `>`.

### `menu_cursor_glyph_style`

Set cursor character style. Default: None.

```fish
set -l menu_cursor_glyph_style -o yellow
```

### `menu_focused_item_style`

Set focused item style. Default: None.

```fish
set -l menu_focused_item_style -o black -b yellow
```

### `menu_selected_item_style`

Set selected item style. Default: None.

```fish
set -l menu_selected_item_style -o black -b yellow
```

### `menu_multiple`

Enables multichoice mode. Default: None.

```fish
set -l menu_multiple 1
```

### `menu_checked_glyph`

If multichoice mode is enabled will display a checked box for selected value. Default: [x]

```fish
set -l menu_checked_glyph 💖
```

### `menu_unchecked_glyph`

If multichoice mode is enabled will display a unchecked box for not selected values. Default: [ ]

```fish
set -l menu_unchecked_glyph 💔
```

## Variables

To know which item was selected, read either of the following scoped variables:

### `menu_selected_index`

Index of the selected item in `$argv`.

### `menu_selected_item`

Value of the selected item in `$argv`.

### Example

```fish
function show_menu
    set -l items "Batman" "Flash" "Superman" "Aquaman" "Darkseid"

    set -l menu_selected_item_style -o black -b yellow
    set -l menu_selected_glyph ▸
    set -l menu_selected_glyph_style -o

    menu $items
end

show_menu
```


[slack-link]: https://fisherman-wharf.herokuapp.com
[slack-badge]: https://fisherman-wharf.herokuapp.com/badge.svg
[fisherman]: https://github.com/fisherman/fisherman
