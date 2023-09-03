# `files` module for startingpoint

The `files` module allows the user to copy files and directories from the repo to the image straight from the recipe.yml
The files are located in `config/files`

Don't use /var or /etc as directories to copy to, as those are writable directories, instead use /usr/etc for /etc, and use workarounds for /var

Example:
```
type: files
  files:
    usr: /usr
```


NOTE: If you couldn't tell, this README is very WIP and should probably be replaced
