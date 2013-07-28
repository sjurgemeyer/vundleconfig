This is a simple vim plugin to automatically load config files for plugins loaded with [Vundle](https://github.com/gmarik/vundle).

I've found it useful to keep separate files for plugin configuration to make them easier to
manage.  This plugin will load configuration files located in a specified directory based on the bundle name.

The config files should be named pluginName.vim and should be located in the ~/.vim/config directory, 
where pluginName is the plugin name without any 'vim' prefix or suffix.  For example if you have the following 
config:
```
Bundle 'tpope/vim-fugitive.git'
```

The configuraiton should be in 
```
~/.vim/config/fugitive.vim
```

In your vimrc, place the vundle config init script right after the vundle init script
```
"Required by Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"Required by vundleconfig
set rtp+=~/.vim/bundle/vundleconfig/
call vundleconfig#init()
```

Be sure any configuration options that your plugin configuration relies on has already been done.  For example, 
make sure your leader is set to what you want.
