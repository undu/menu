[![Slack Room][slack-badge]][slack-link]

# Menu

**Menu** is a fish library to create interactive prompt menus.

## Install

With [fisherman]

```
fisher menu
```

![menu](https://cloud.githubusercontent.com/assets/8317250/14814942/8e172e96-0be3-11e6-86df-72e698c78919.gif)

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

```
set -l menu_selected_glyph_style -o yellow
```

### `menu_selected_item_style`

Set selected item style. Default: None.

```
set -l menu_selected_item_style -o black -b yellow
```

## Variables

To know the item was selected, read any of the following variables:

### `menu_selected_index`

Index of the selected item in `$argv`.

### `menu_selected_item`

Value of the selected item in `$argv`.

### Examples

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
