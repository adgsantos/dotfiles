# https://www.reddit.com/r/unixporn/comments/7lt3n8/oc_a_little_bit_of_workflow_porn_short_script_in/
alias p='pin'
printpins() {
    count=1
    while read -r pin; do
        echo "$count $(basename "$pin")"
        (( count++ ))
    done < $1
}

pin() {
	mkdir -p $HOME/.pins
    pindir=$HOME/.pins
    case "$1" in
        "")
            printpins $pindir ;;
        "p")
            echo "$PWD" >> $pindir ;;
        "del")
            sed -i "$2d" "$pindir" ;;
        "[0-9][0-9]*")
            echo "$1" >> $pindir ;;
        *)
            cd "$(sed "$1q;d" "$pindir")" ;;
    esac
}
