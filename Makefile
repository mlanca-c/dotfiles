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
OS	:= ubuntu

# Ubuntu package manager
PACKAGE_MANAGER := apt
UPDATE_SYSTEM	:= sudo ${PACKAGE_MANAGER} update
UPGRADE_SYSTEM	:= sudo ${PACKAGE_MANAGER} upgrade -y

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

ifeq ($(shell uname),Linux)
	SED := sed -i.tmp --expression
else ifeq ($(shell uname),Darwin)
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
# Here we define the files/folders that will be installed in the system
# The format is: DOTFILES_<NAME> := .file1:.file2:folder1/:folder2/:
DOTFILES	:= .vimrc .vim

# DOTFILES_ROOT_LIST := $(addprefix ${HOME}/,${DOTFILES})
# DOTFILES_ROOT_LIST := $(foreach dl,${DOTFILES},$(subst :,:${HOME}/,${dl}))
# DOTFILES_ROOT_LIST := $(subst :,${space},${DOTFILES})
# # Adding the root directory to the files
# DOTFILES_DIRS_LIST := $(addprefix ${HOME}/,${DOTFILES})
# DOTFILES_DIRS_LIST := $(foreach dl,${DOTFILES_DIRS_LIST},$(subst :,:${HOME}/,${dl}))
# DOTFILES_DIRS_LIST := $(subst :,${space},${DOTFILES_DIRS_LIST})


# **************************************************************************** #
# Utillity Targets
# **************************************************************************** #

# Force target to always run
.FORCE: ;

# Debug variable
print-%: ; @echo $*=$($*)


# **************************************************************************** #
# System Targets
# **************************************************************************** #

# Update the system
system_update: ${OS}_update

ubuntu_update:
	${AT}${PRINT} "${_INFO} Checking system...\n"
	${AT}${PRINT} "${_INFO} ${OS} detected...\n"
	${AT}${UPDATE_SYSTEM}
	${AT}${UPGRADE_SYSTEM}
	${AT}${PRINT} "${_SUCCESS} System updated!\n"


# **************************************************************************** #
# Project Targets
# **************************************************************************** #

install: backup_clean


backup: $(foreach dir,${DOTFILES},backup-${dir})
	${AT}${PRINT} "${_SUCCESS} all dotfiles where backed up!\n"
	${AT}${PRINT} "${_SUCCESS} backup folder: ${BACKUP_DIR}\n"

link: $(foreach dir,${DOTFILES_DIRS_LIST},link-${dir})

# **************************************************************************** #
# Target Templates
# **************************************************************************** #

define make_backup
backup-$1:
	$${AT}$${PRINT} "$${_INFO} backing up $1 ...\n"
	$${AT}$${MKDIR} $${BACKUP_DIR}
	$${AT}$${CP} $${HOME}/$1 $${BACKUP_DIR} || true
endef

define make_clean
clean-$1:
	$${AT}$${PRINT} "$${_INFO} removing $1...\n"
	$${AT}$${RM} $${HOME}/$1
	$${AT}$${PRINT} "$${_SUCCESS} $1 dotfiles cleaned up.\n"
endef

define make_link
link-$1:
	$${AT}$${PRINT} "$${_INFO} linking $1...\n"
	$${AT}$${LINK} $${ROOT_DIR}/$1 $${HOME}/.$1
endef


# **************************************************************************** #
# Target Generator
# **************************************************************************** #

$(foreach dir,${DOTFILES},$(eval\
$(call make_backup,${dir})\
))


# Get where the file should go from DOTFILES_DIRS_LIST,
# and at the same time get where the is in the root directory
$(foreach dir,${DOTFILES_DIRS_LIST},$(eval\
$(call make_link,${dir})\
))

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
