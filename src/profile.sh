# To avoid potential situation where cdm(1) crashes on every TTY, here we
# default to execute cdm(1) on tty1 only, and leave other TTYs untouched.
# For the case where /root/.bash_profile is a symlink to your users
# bash_profile, cdm will check if you're root and not launch.
if [ "$UID" != "0" -a "$(tty)" = '/dev/tty1' ]; then
        [ -z "$CDM_SPAWN$DISPLAY$SSH_TTY$(pgrep xinit)" ] && {
                exec cdm
        }
fi
