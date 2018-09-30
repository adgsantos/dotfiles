# Some colors
# ESC[Value;...;Valuem
# 4 bit
# 0-8 attributes
# 30-37 foregroud
# 40-48 background

# 8bit
# \e38;5;${val}mr- foreground
# \e48;5;${val}m - background

BLACK_8=$'%{\e[1;30m%}'
RED_8=$'%{\e[1;31m%}'
GREEN_8=$'%{\e[1;32m%}'
YELLOW_8=$'%{\e[1;33m%}'
BLUE_8=$'%{\e[1;34m%}'
MAGENTA_8=$'%{\e[1;35m%}'
CYAN_8=$'%{\e[1;36m%}'
WHITE_8=$'%{\e[1;37m%}'

RESET_COLOR=$'%{\e[0m%}'

DARK_GREY=$'%{\e[38;5;240m%}'
RED=$'%{\e[38;5;196m%}'

