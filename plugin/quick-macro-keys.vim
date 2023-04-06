function! MapKeyToCommand(key)
    let command = input("Enter the command to execute (use ':!' for shell commands): ")
    execute "nnoremap " . a:key . " " . command
    echo "Key '" . a:key . "' mapped to command '" . command . "'"

    " Save the mapping to a file in the global directory
    let global_dir = expand("~/.vim-macro-keys")
    if !isdirectory(global_dir)
        call mkdir(global_dir, "p")
    endif
    let cwd = getcwd()
    let filename = substitute(cwd, "/", "-", "g") . ".vim"
    let filepath = global_dir . "/" . filename
    call writefile(["nnoremap " . a:key . " " . command], filepath, "a")
endfunction

function! LoadMacroKeys()
    " Load the mappings from the global directory
    let global_dir = expand("~/.vim-macro-keys")
    let cwd = getcwd()
    let current_path = cwd
    let paths = []

    " Get all parent paths
    while current_path != "/"
        let paths = add(paths, current_path)
        let current_path = fnamemodify(current_path, ":h")
    endwhile

    " Reverse the list to load mappings from the topmost directory down to the current directory
    let paths = reverse(paths)

    " Load mappings from each directory
    for path in paths
        let filename = substitute(path, "/", "-", "g") . ".vim"
        let filepath = global_dir . "/" . filename
        if filereadable(filepath)
            execute "source " . filepath
        endif
    endfor
endfunction

function! ShowMacroMappings()
    let key_list = ['<leader>m1', '<leader>m2', '<leader>m3', '<leader>m4', '<leader>m5']
    let mappings = []

    for key in key_list
        let cmd = maparg(key, "n")
        if cmd != ""
            let mappings += [key . ' -> ' . cmd]
        endif
    endfor

    " Open a new buffer and display the mappings
    new Macro Key Mappings
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    call setline(1, mappings)
    setlocal nomodifiable
    normal! gg
endfunction

function! UnsetKeyMessage()
    echo "Key not set. Please set it first using the corresponding double leader command."
endfunction

nnoremap <leader>m1 :call UnsetKeyMessage()<CR>
nnoremap <leader>m2 :call UnsetKeyMessage()<CR>
nnoremap <leader>m3 :call UnsetKeyMessage()<CR>
nnoremap <leader>m4 :call UnsetKeyMessage()<CR>
nnoremap <leader>m5 :call UnsetKeyMessage()<CR>
nnoremap <leader>ms :call ShowMacroMappings()<CR>

nnoremap <leader><leader>m1 :call MapKeyToCommand('<leader>m1')<CR>
nnoremap <leader><leader>m2 :call MapKeyToCommand('<leader>m2')<CR>
nnoremap <leader><leader>m3 :call MapKeyToCommand('<leader>m3')<CR>
nnoremap <leader><leader>m4 :call MapKeyToCommand('<leader>m4')<CR>
nnoremap <leader><leader>m5 :call MapKeyToCommand('<leader>m5')<CR>

" Load the mappings for the current working directory
autocmd VimEnter * call LoadMacroKeys()


