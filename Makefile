# **************************************************************************** #
#  dotfiles Makefile
#
#  This Makefile automates the installation of the dotfiles in the system.
#
#  user: mlanca-c
#  version: 0.1
#  url: https://github.com/mlanca-c/dotfiles
#
# **************************************************************************** #

PROJECT := dotfiles
VERSION := 0.1

USER := $(shell whoami)


# **************************************************************************** #
# Configs
# **************************************************************************** #

# Operative System
OS	:= $(shell uname)


# Verbose levels
# 0: Make will be totaly silenced
# 1: Make will print echos and printf
# 2: Make will not be silenced but target commands will not be printed
# 3: Make will print each command
# 4: Make will print all debug info
#
# If no value is specified or an incorrect value is given make will print each
# command like if VERBOSE was set to 3.
VERBOSE	:= 2

ifeq ($(VERBOSE),0)
	MAKEFLAGS += --silent
	BLOCK := &>/dev/null
else ifeq ($(VERBOSE),1)
	MAKEFLAGS += --silent
else ifeq ($(VERBOSE),2)
	AT := @
else ifeq ($(VERBOSE),4)
	MAKEFLAGS += --debug=v
endif


# **************************************************************************** #
# File Manipulation
# **************************************************************************** #

RM		:= rm -f
PRINT	:= printf
CP		:= cp -r
MV		:= mv
MKDIR	:= mkdir -p
NORM	:= norminette
FIND	:= find
LINK	:= ln -s

ifeq (${OS},Linux)
	SED := sed -i.tmp --expression
else ifeq (${OS},Darwin)
	SED := sed -i.tmp
endif


# Definitions
T		:= 1
comma	:= ,
empty	:=
space	:= $(empty) $(empty)
tab		:= $(empty)	$(empty)


# **************************************************************************** #
# Content Folders
# **************************************************************************** #

ROOT_DIR	:= ${PWD}
BACKUP_DIR	:= ${HOME}/.dotfiles_backup


# **************************************************************************** #
# Files
# **************************************************************************** #


ZSH_FILES	:= .zshrc


# **************************************************************************** #
# Utillity Targets
# **************************************************************************** #

# Force target to always run
.FORCE: ;

# Debug variable
print-%: ; @echo $*=$($*)


# **************************************************************************** #
# Project Targets
# **************************************************************************** #

system_update:
	${AT}${PRINT} "${_INFO} Checking system...\n"
	${AT}sudo apt update
	${AT}sudo apt upgrade -y
	${AT}${PRINT} "${_SUCCESS} System updated.\n"


install: install-vim install-zsh install-tmux install-git

backup: backup-zsh backup-tmux

clean: backup-clean
backup-clean: clean-zsh clean-tmux

clean-%:
	${AT}${PRINT} "${_INFO} Backing up $* dotfiles...\n"
	${AT}${MKDIR} ${BACKUP_DIR}/$*
	${AT}${MV} ${HOME}/.$* ${BACKUP_DIR}/.$*
	${AT}${PRINT} "${_SUCCESS} $* dotfiles backed up.\n"

backup-%:
	${AT}${PRINT} "${_INFO} Backing up $* dotfiles...\n"
	${AT}${MKDIR} ${BACKUP_DIR}/$*
	${AT}${CP} ${HOME}/.$* ${BACKUP_DIR}/.$*
	${AT}${PRINT} "${_SUCCESS} $* dotfiles backed up.\n"

# **************************************************************************** #
# Functions
# **************************************************************************** #

# **************************************************************************** #
# Colors and Messages
# **************************************************************************** #

# Colors
GREEN		:= \e[38;5;2m
BLUE		:= \e[38;5;20m
YELLOW		:= \e[38;5;3m
RED			:= \e[38;5;1m
DRED		:= \e[38;5;88m
GRAY		:= \e[38;5;8m
RESET		:= \e[0m

# Messages
_SUCCESS	:= ${GREEN}[ok]:${RESET}
_INFO		:= ${YELLOW}[info]:${RESET}
_FAILURE	:= ${RED}[ko]:${RESET}
