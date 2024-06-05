# Problem Statement

I currently use Ubuntu OS on both my personal and work computers. However, I’m not a fan of GNOME, which led me to explore other OS options like Manjaro and Arch. These alternatives offered different desktop environments, but I still prefer Ubuntu due to its balance of simplicity and reliability.

After a year of using Arch-based distros, I decided to return to Ubuntu, but without GNOME. My goal is to create a fully customized, efficient desktop environment on Ubuntu that is easy to update and consistent across multiple machines.

In this proposal, I will outline the components of the v1 of my customized Ubuntu setup, or "rice," and the strategy for maintaining this configuration. This includes managing dotfiles and system requirements.

## Defining the “End Game” for v1

A complete v1 of my riced Ubuntu setup will feature a customized **tiling window manager** environment, with a working **terminal emulator**, a **file manager**, and **text editor**. The system will include necessary productivity tools, and all visual elements such as **themes**, **icons**, and **fonts** will be consistently applied. Custom **keyboard shortcuts** and **panel layouts** will be configured for efficiency.

**Dotfiles** will be managed using a Git repository, and an **installation script** will automate the setup process on new machines. Regular backups and a defined update process will ensure maintenance and consistency.

**Once this is successfully achieved, I will test v1 for the minimum period of 6 months in all my machines.**

# Riced Ubuntu - v1

## Technology Stack

### Tiling Window Manger

- **choice:** `dwm` (dynamic window manager)
- **Rationale**: Known for its simplicity, efficiency, and minimalism. Provides dynamic tiling, customization through patches, and extensibility through scripting.

### Terminal Emulator

- **Choice**: `alacritty`
- **Rationale**: A fast, GPU-accelerated terminal emulator written in Rust. Known for its minimalism, performance, and configurability.

### File Manager

- **Choice**: `nautilus` (GNOME Files)
- **Rationale**: A robust, user-friendly file manager that integrates well with the GNOME desktop environment. Provides essential file management features with a clean and intuitive interface.

### Text Editor/IDE

- **Choice**: `vim`/`neovim`
- **Rationale**: A highly customizable, modal text editor with a strong focus on efficiency and productivity. Neovim is a modern fork of Vim with additional features and improvements.

### Additional Tools

- **Launcher:** `dmenu`
  - **Rationale**: dmenu is a fast and lightweight dynamic menu for X. It allows for quick and efficient launching of applications and execution of commands. Integrating dmenu into your workflow enhances the usability and productivity of your customized Ubuntu environment.

### Compositor

- **Choice**: `compton`
- **Rationale**: A lightweight compositor for window effects, transparency, and desktop animations. Enhances the visual experience without sacrificing performance.

### Theming and Appearance

- **Theme**: Nord theme for a consistent and visually appealing look and feel.
- **Icons**: Font Awesome for a comprehensive set of icons.
- **Fonts**: JetBrains Mono font for code editing.

### System Management

- **Scripting**: Utilize shell scripts for automation tasks, such as setting up the environment, managing configurations, and performing system maintenance.

### Version Control System

- **Choice**: Git
- **Rationale**: Git is widely used for version control and allows you to manage and track changes to your dotfiles and other configuration files effectively.

## System Maintenance & Consistency

To ensure system maintenance and consistency across multiple machines, the following strategies will be implemented:

### Dotfile Management

All configuration files, commonly referred to as dotfiles, will be stored in a version control system using Git. This approach offers the following benefits:

- **Version Control**: Git allows for tracking changes to dotfiles over time, enabling easy rollback to previous configurations if needed.
- **Synchronization**: By maintaining dotfiles in a Git repository, configurations can be synchronized effortlessly across different machines, ensuring consistency.
- **Collaboration**: Git provides a centralized platform for collaboration, facilitating sharing and management of configurations with others.
- **Backup**: Dotfiles are effectively backed up in the Git repository, mitigating the risk of data loss due to system failures or accidental deletions.

### Installation Script

An installation script will be created to automate the setup process on new machines or after a system reinstall. This script will encompass the following tasks:

- **Package Installation**: Necessary software packages and dependencies for the customized Ubuntu setup will be installed using the package manager (e.g., apt).
- **Configuration Application**: Customized configurations, including dotfiles, theme settings, keyboard shortcuts, and panel layouts, will be applied to ensure consistency across machines.

By implementing dotfile management and creating an installation script, a robust system maintenance strategy will be established. This ensures that the customized Ubuntu setup remains **consistent, easily deployable, and well-maintained across all machines**.

## Implementation Plan

### 1. Initial Setup and Environment Configuration

- Set up a development environment on your primary machine.
- Install necessary tools and dependencies for customization, including Git, Vim/Neovim, and relevant packages for your chosen window manager and terminal emulator.

### 2. Dotfile Management

- Create a Git repository to store your dotfiles.
- Start by adding essential dotfiles such as `.bashrc`, `.vimrc`, and `.config` files for your chosen applications.
- Commit and push changes to the repository regularly to ensure version control.

### 3. Configuration Customization

- Customize configurations for your tiling window manager (dwm), terminal emulator (Alacritty), file manager (Nautilus), and text editor (Vim/Neovim).
- Experiment with themes, icons, fonts, and other visual elements to achieve the desired look and feel.
- Define keyboard shortcuts, panel layouts, and other efficiency-enhancing configurations.

### 4. Installation Script

- Write a shell script to automate the setup process on new machines.
- Include commands for installing necessary packages, applying configurations, and setting up essential tools and applications.
- Test the installation script thoroughly to ensure its reliability and effectiveness.

### 5. Testing and Validation

- Deploy your customized setup on multiple machines for testing.
- Validate configurations against common use cases and workflows to identify and address any issues or inconsistencies.
- Collect feedback from users and iterate on configurations as needed.

### 6. Documentation and User Guide

- Document your setup process, configurations, and customization choices.
- Create a user guide or README file to provide instructions for setting up and maintaining the customized Ubuntu environment.
- Include troubleshooting tips and common issues along with their solutions.

### 7. Continuous Maintenance and Updates

- Establish a routine for regular maintenance tasks, including system updates, backup procedures, and configuration adjustments.
- Monitor system performance and address any issues promptly to ensure optimal functionality.
- Keep the installation script and documentation up-to-date with any changes or improvements.

## **Future Enhancements**

### Multi-Monitor Support

- Enhance multi-monitor support with advanced features such as independent workspace configurations, custom display arrangements, and optimized window management across screens.

### Taskbar and Notification System

- Develop a customizable taskbar and notification system to provide quick access to running applications and notifications without interrupting workflow.

### Backup and Restore Feature

- Implement a backup strategy to protect your data and configurations. Regularly back up critical files, including dotfiles, documents, and application settings. Consider using tools like rsync for incremental backups or automated backup solutions for convenience.
- **Configuration Backup**: Ensure that your installation script includes provisions for backing up existing configurations before applying new ones. This allows you to revert to a previous state if the new setup encounters issues.

### Testing and Validation

- Test your setup thoroughly on different machines to ensure that configurations work as intended. Validate the setup against common use cases and workflows to identify and address any issues or inconsistencies.
