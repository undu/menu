function -S menu
    function __menu_move_print -a row col
        set -e argv[1..2]
        printf "\x1b[$row;$col""f$argv"
    end

    function __menu_fullscreen
        switch "$argv"
            case --enter
                tput smcup
                stty -echo

            case --leave
                tput rmcup
                stty echo
        end
    end

    function -S __menu_draw_items -a row_index
        set -e argv[1]

        for i in (seq $item_count)
            if test "$i" = "$row_index"
                set -l glyph "$selected_glyph_style$selected_glyph$normal"
                set -l item "$selected_item_style$argv[$i]$normal"

                __menu_move_print $i 1 " $glyph $item"
            else
                __menu_move_print $i 1 "   $argv[$i]"
            end
        end
    end

    set menu_selected_index
    set menu_selected_item

    set -l selected_glyph ">"
    set -l selected_glyph_style
    set -l selected_item_style
    set -l normal

    if test ! -z "$menu_selected_glyph"
        set selected_glyph "$menu_selected_glyph"
    end

    if test ! -z "$menu_selected_glyph_style"
        set selected_glyph_style (set_color $menu_selected_glyph_style)
        set normal (set_color normal)
    end

    if test ! -z "$menu_selected_item_style"
        set selected_item_style (set_color $menu_selected_item_style)
        set normal (set_color normal)
    end

    set -l row_index 1
    set -l item_count (count $argv)

    tput civis
    stty -icanon -echo

    __menu_fullscreen --enter

    __menu_draw_items 1 $argv

    while true
        dd bs=1 count=1 ^ /dev/null | read -p "" -l c

        switch "$c"
            case ""
                set menu_selected_index "$row_index"
                set menu_selected_item "$argv[$row_index]"

                __menu_fullscreen --leave
                break

            case "["
                dd bs=1 count=1 ^ /dev/null | read -p "" -l c

                switch "$c"
                    case A
                        set row_index (echo $row_index - 1 | bc)
                        if test "$row_index" -le 0
                            set row_index 1
                        end

                    case B
                        set row_index (echo $row_index + 1 | bc)
                        if test "$row_index" -ge $item_count
                            set row_index $item_count
                        end
                end
        end

        clear

        __menu_draw_items $row_index $argv
    end

    functions -e __menu_move_print __menu_fullscreen __menu_draw_items

    tput cvvis
end
