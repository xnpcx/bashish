#!/bin/sh
# Created by KrON from windowmaker on IRC
# Changed by Spidey 08/06
# converted to bashish, and updated by arno
# stolen from the now defunct bashprompt project:
# now found at http://cygutils.fruitbat.org/bashprompt/index.html
# originally http://web.archive.org/web/20010406040532/bash.current.nu/themes.html

_bashish_prompt () {
eval $(_bashish_prompt_shellvars "$SHELLNAME")
eval $(_bashish_prompt_parsecolors "$@")
test "x$BASHISH_COLOR0" = x && eval $(_bashish_prompt_parsecolors blue red)
test "x$BASHISH_COLOR1" = x && eval $(_bashish_prompt_parsecolors "$1" red)

typeset BASHISH_DA=`_bashish_prompt_cp437 DA` # ┌
typeset BASHISH_C0=`_bashish_prompt_cp437 C0` # └
typeset BASHISH_C4=`_bashish_prompt_cp437 C4` # ─
typeset BASHISH_F9=`_bashish_prompt_cp437 F9` # ∙
typeset BASHISH_FA=`_bashish_prompt_cp437 FA` # ·
test "x$PROMPTSTR" = x && typeset PROMPTSTR="${USER}${ESC}[3${BASHISH_COLOR0}m@${ESC}[3${BASHISH_COLOR1}m${HOSTNAME%%.*}"
typeset RCS_PS1=$(_bashish_prompt_rcs)
test "x${RCS_PS1}" != x && RCS_PS1="${EMBED}${ESC}[3${BASHISH_COLOR0}m${UNEMBED}|${EMBED}${ESC}[3${BASHISH_COLOR0};1m${UNEMBED}${RCS_PS1}"

PS1="${ESC}[3${BASHISH_COLOR1}m${BASHISH_DA}${BASHISH_C4}\
${ESC}[3${BASHISH_COLOR0}m(${ESC}[3${BASHISH_COLOR1}m${PROMPTSTR}${ESC}[3${BASHISH_COLOR0}m)\
${ESC}[3${BASHISH_COLOR1}m-\
${ESC}[3${BASHISH_COLOR0}m(\
${ESC}[3${BASHISH_COLOR1}m${TIME}\
${ESC}[3${BASHISH_COLOR0}m\
${ESC}[6D:\
${ESC}[2C:\
${ESC}[2C\
${ESC}[3${BASHISH_COLOR0}m-:-\
${ESC}[3${BASHISH_COLOR1}m$(date +%d/%m)\
${ESC}[3${BASHISH_COLOR0}m\
${ESC}[3D/\
${ESC}[2C\
${ESC}[3${BASHISH_COLOR0}m)\
${ESC}[3${BASHISH_COLOR1}m${BASHISH_C4}-\
${ESC}[3${BASHISH_COLOR0}m]${BASHISH_F9}\
${ESC}[3${BASHISH_COLOR1}m-${BASHISH_F9}${BASHISH_F9}\
${ESC}[3${BASHISH_COLOR0}m${BASHISH_FA}
${EMBED}${ESC}[3${BASHISH_COLOR1}m${UNEMBED}${BASHISH_C0}${BASHISH_C4}\
${EMBED}${ESC}[3${BASHISH_COLOR0}m${UNEMBED}(\
${EMBED}${ESC}[3${BASHISH_COLOR1}m${UNEMBED}${PWD##*/}${RCS_PS1}\
${EMBED}${ESC}[3${BASHISH_COLOR0}m${UNEMBED})\
${EMBED}${ESC}[3${BASHISH_COLOR1}m${UNEMBED}${BASHISH_C4}${BASHISH_F9}\
${EMBED}${ESC}[3${BASHISH_COLOR0}m${UNEMBED}${BASHISH_FA}\
${EMBED}${ESC}[0m${UNEMBED} "
}
