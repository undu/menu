[![Slack Room][slack-badge]][slack-link]

# Menu

**Menu** is a fish library to create interactive prompt menus.

## Install

With [fisherman]

```
fisher menu
```

<img width="60%" src="https://cloud.githubusercontent.com/assets/8317250/14820969/d6d40c38-0c03-11e6-851e-6a927f7b9d3e.gif">

## Usage

```
menu 1 2 3
> 1  
  2
  3
```

## Options

### `menu_selected_glyph`

Set cursor character. Default: `>`.

### `menu_selected_glyph_style`

Set cursor character style. Default: None.

```fish
set -l menu_selected_glyph_style -o yellow
```

### `menu_selected_item_style`

Set selected item style. Default: None.

```fish
set -l menu_selected_item_style -o black -b yellow
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
