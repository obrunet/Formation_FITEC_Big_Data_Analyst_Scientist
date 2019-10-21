    1  clear
    2  set bonjour "deux coucou" salut
    3  set "$@"
    4  echo $#
    5  echo $2
    6  echo $*
    7  history > param_concat_tab.sh
