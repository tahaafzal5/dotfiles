# dotfiles

My personal dotfiles

---

I could have either used a [bare git repo](https://www.atlassian.com/git/tutorials/dotfiles) or choose to use [stow](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html). Setup was simpler with stow hence I chose that.

## Prerequisites
* ssh keys configured for GitHub
* GNU stow

## Setup
* Clone the repo wherever you want
* Run `setup.sh` in the repo's root

## Adding a new dotfile
* Make a directory for the dotfile for organization
* Add the dotfile(s) in that directory
* Add symlink to $HOME
  ```sh
  stow <directory> -t ~/
  ```