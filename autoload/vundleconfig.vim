function! BundleWithConfig(...)
    call vundle#config#bundle(a:1)
    let filename = split(a:1, '/')[-1]
    let configName = GetNiceBundleName(filename)
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
    let splitName = split(a:name, '[-]')
	let result = ''
    for x in splitName
        if x != 'vim'
			let result = result . '-' . x
        endif
    endfor
    let baseName = split(result, '[\.]')[0]
	return strpart(baseName, 1) . '.vim'
endfunction

com! -nargs=+         Plugin
\ call BundleWithConfig(<args>)

func! vundleconfig#init(...) abort
endf
