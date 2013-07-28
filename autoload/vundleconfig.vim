function! BundleWithConfig(...) 
    call vundle#config#bundle(a:1)
    let lastPart = split(a:1, '/')[-1]
    let configName = GetNiceBundleName(lastPart) . '.vim'
    let configFolder = '~/.vim/config/'

    let paths = globpath(configFolder, configName, 1)
    if (len(paths) > 0)
        "echo 'found config for ' . configName
        execute 'so ' . configFolder . configName
    else
        "echo 'no config for ' . configName
    endif
endfunction

function! GetNiceBundleName(name) 
    let splitName = split(a:name, '[-\.]')
    for x in splitName
        if x != 'vim'
            return x
        endif
    endfor
endfunction

com! -nargs=+         Bundle
\ call BundleWithConfig(<args>)

func! vundleconfig#init(...) abort
endf
