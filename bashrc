# 비로그인 셀일 때 bash를 사용하면 참고할 사항을 정의해 놓은 파일
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# 상호작용하지 않을 때 아무것도 하지말아야함
case $- in
    *i*) ;;
      *) return;;
esac
# -변수에 들어있는 값을 참조하여 케이스문


# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# 변수에 값을 입력함

# append to the history file, don't overwrite it
shopt -s histappend
# shopt 프로그램에 -s histappend 옵션을 주고 실행합
# shell options 프로그램으로 쉘에 histappend 옵션을 적용하는구문
# histappend 는 command history 적용하는 옵션

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
# 변수에 값을 입력함

# 필요하다면 각 명령마다 윈도우 사이즈를 확인해야함
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# shopt 프로그램에 -s checkwinsize 옵션을 주고 실행함
# 이것은 윈도우사이즈를 확인해주고 다음 행을 넘어가는 역할  

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# /usr/bin/lesspipe 파일이 존재하고 실행 가능하다면
# SHELL=/bin/sh lesspipe 명령어 실행 

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
# debian_chroot 문자가 비어있고 /etc/debian_chroot 파일이 존재하고 읽을수 있으면
# debian_chroot 에 /etc/debian_chroot 파일 내용을 입력

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
# TERM변수가 케이스문을 만족하면 color_prompt에 yes를 입력

# terminal이 능력이 있으면 colored prompt를 위해 uncomment;
# 사용자를 방해하지 않기 위해 default로 인해 꺼진다:
# terminal은 prompt가 아닌 command에 집중되어야 한다
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi
# force_color_prompt 문자열이 존재하고
# /usr/bin/tput 파일이 존재하면서 실행가능하며 tput setaf 1 을 실행한 결과를 
# /dev/null에 리다이렉션하는데 성공하면 color_prompt에 yes입력
# 아니면 color_prompt에 NULL 입력

# tput 은 색깔과 함께 출력해주는 프로그램
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
# color_prompt가 yes면
# PS1(쉘 프롬프트)에 색상을 입혀서 적용
# 아니라면 흰색으로 적용

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
#case문에 따라 무엇이냐에 따라 쉘 프롬프트 변경

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# /usr/bin/dircolors 파일이 있고 실행가능하고
# 홈파일에 ./dircolors가 존재하면서 읽을수도 있다면
# dircolors -b ~/.dircolors 명령어 실행 
# 해당 명령어가 실패하면 dircolors -b 명령어 실행
# ls, grep, fgrep, egrep에 alias를 걸어 해당 명령어 입력시 우측으로 치환


# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
#ll, la , l 에 alias를 걸어 우측으로 치환

# Add an "alert" alias for long running commands.  Use like so:
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# 위와 동일하게 alias 적용

#이곳으로 바로 디렉트하는 것보다 다른 파일들로 나누는 것을 바란다면
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# 홈디렉토리의 .bash_aliases가 존재하고 정규 파일이면 if문 실행

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# shopt -op posix 가 거짓이면서
# /usr/share/bash-completion/bash_complition 파일이 존재하고 정규파일이면 명령어 실행
# 위의 값이 거짓이고 /etc/bash_completion 파일이 존재하며 정규파일이면 명령어 실행
