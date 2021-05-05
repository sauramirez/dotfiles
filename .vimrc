call plug#begin('~/.vim/plugged')
syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'Lokaltog/vim-easymotion'
Plug 'myusuf3/numbers.vim'
Plug 'kien/ctrlp.vim'
" Plug 'tpope/vim-pathogen'
Plug 'tpope/vim-unimpaired'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/neocomplcache'
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/django.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'elzr/vim-json'
Plug 'wting/rust.vim'
Plug 'lepture/vim-jinja'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'Lokaltog/powerline'
Plug 'altercation/vim-colors-solarized'
Plug 'sheerun/vim-polyglot'
Plug 'evanleck/vim-svelte'
Plug 'dense-analysis/ale'
Plug 'posva/vim-vue'
" Add plugins to &runtimepath
call plug#end()

" Vim settings {
    syntax enable
    let mapleader = ","
    "set bs=2
    if has('gui_running')
        set background=dark
        let g:solarized_termcolors=256
        colorscheme solarized
    else
        set background=dark
        colorscheme solarized
    endif

    "set guifont=Fira\ Mono:h12
    set guifont=Dank\ Mono\ Regular:h14
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    " highlight tabs and trailing spaces
    set list
    set listchars=tab:›\ ,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

    map <silent> <D>] gt
    map <silent> <D>[ gT

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " 03. Theme/Colors
    " "
    " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set t_Co=256              " enable 256-color mode.
    " syntax enable             " enable syntax highlighting (previously
    " syntax on).
    " colorscheme molokai       " set colorscheme
    "
    " " Prettify JSON files
    "autocmd BufRead,BufNewFile *.json set filetype=json
    "autocmd Syntax json sou ~/.vim/syntax/json.vim
    "
    " " Prettify Vagrantfile
    autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
    "
    " " Highlight characters that go over 80 columns
    highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    match OverLength /\%81v.\+/

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " 04. Vim UI
    "
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set number                " show line numbers
    set cul                   " highlight current line
    set laststatus=2          " last window always has a statusline
    set nohlsearch            " Don't continue to highlight searched phrases.
    set incsearch             " But do highlight as you type your search.
    set ignorecase            " Make searches case-insensitive.
    set ruler                 " Always show info along bottom.
    set showmatch
    set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " 05. Text Formatting/Layout
    "
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set autoindent            " auto-indent
    set tabstop=4             " tab spacing
    set softtabstop=4         " unify
    set shiftwidth=4          " indent/outdent by 4 columns
    set shiftround            " always indent/outdent to the nearest tabstop
    set expandtab             " use spaces instead of tabs
    set smarttab              " use tabs at the start of a line, spaces elsewhere
    set nowrap                " don't wrap text
" }


" Plugins settings {
    " NerdTree {
       map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
       map <leader>e :NERDTreeFind<CR>
       nmap <leader>nt :NERDTreeFind<CR>

       let NERDTreeShowBookmarks=1
       let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
       let NERDTreeChDirMode=0
       let NERDTreeQuitOnOpen=1
       let NERDTreeMouseMode=2
       let NERDTreeShowHidden=1
       let NERDTreeKeepTreeInNewTab=1
       let g:nerdtree_tabs_open_on_gui_startup=0
    " }

    " Numbers {
        nnoremap <C-l> :NumbersToggle<CR>
    " }

    " vim flakes {
        let g:flake8_ignore="E501"
        map <C-f> :call Flake8()
        "autocmd BufWritePost *.py call Flake8()
    " }

    " Syntastic {
       " set statusline+=%#warningmsg#
       " set statusline+=%{SyntasticStatuslineFlag()}
       " set statusline+=%*

       " let g:syntastic_python_flake8_exec = '/Users/essauramirez/.pyenv/shims/flake8'

       " let g:syntastic_always_populate_loc_list = 1
       " let g:syntastic_auto_loc_list = 1
       " let g:syntastic_check_on_open = 0
       " let g:syntastic_always_populate_loc_list = 1
    "   let g:syntastic_check_on_wq = 0
    "   let g:syntastic_python_flake8_args=''
       " let g:syntastic_python_checkers = ['flake8']
       "let g:syntastic_python_checker_args='--ignore=E501'
       " let g:syntastic_python_flake8_post_args='--ignore=E501'
       "let g:syntastic_javascript_checkers = ['eslint']
       " let g:syntastic_javascript_eslint_exec='npx eslint'
       "function! StrTrim(txt)
        "return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
       "endfunction
       "let b:syntastic_javascript_eslint_exec = StrTrim(system('npm-which eslint'))
        " --ignore=E503
        " let g:syntastic_javascript_checkers = ['eslint']
        " let g:syntastic_javascript_eslint_exec = 'npx eslint'
        " let g:syntastic_javascript_eslint_generic = 1
       " function! SyntasticCheckHook(errors)
         " if !empty(a:errors)
           " let g:syntastic_loc_list_height = min([len(a:errors), 5])
         " endif
       " endfunction
    " }

    let g:svelte_indent_script = 0
    let g:svelte_indent_style = 0
    " Ale {
        let b:ale_linters = ['eslint', 'flake8']
        "let g:ale_linters_explicit = 1
        let g:ale_sign_error = '✘'
        let g:ale_sign_warning = '⚠'
        let g:ale_virtualenv_dir_names = []
        highlight ALEErrorSign ctermbg=NONE ctermfg=red
        highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
        let g:ale_python_flake8_options = '--ignore=E501'
        let g:ale_fixers = {
                    \'javascript': ['eslint'],
                    \}
        let g:ale_fix_on_save = 1
        nnoremap <silent> <leader>an :ALENext<CR>

        "let g:ale_terraform_terraform_executable = '/Users/essauramirez/Development/bin/terraform'
    " }

    " Ctrlp {
        let g:ctrlp_working_path_mode = 2
        set wildignore+=*.pyc
        nnoremap <silent> <D-t> :CtrlP<CR>
        nnoremap <silent> <D-r> :Ctr
	nnoremap <silent> <Space>m :CtrlPMixed<CR>
	nnoremap <silent> <Space>r :CtrlPMRU<CR>

        " let g:ctrlp_custom_ignore = 'indelek/media\|htmlcov\|media|indelek/static$'
        let g:ctrlp_user_command = {
            \ 'types': {
              \ 1:  ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
            \ },
            \ 'fallback': 'find %s -type f'
        \ }
    " }

    " Fugitive {
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiffsplit<CR>
        nnoremap <silent> <leader>gc :Git commit<CR>
        nnoremap <silent> <leader>gb :Git blame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>ga :Gwrite<CR>
        nnoremap <silent> <leader>go :diffoff<CR>
    " }

    " neocomplcache {
        imap <C-k>     <Plug>(neocomplcache_snippets_expand)
        "smap <C-k>     <Plug>(neosnippet_expand_or_jump)

        " Enable omni completion. Not required if they are already set
        " elsewhere in .vimrc
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd Filetype python setlocal ts=4 sts=4 sw=4
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    " }
    "
    " vue {
        let g:vue_pre_processors = []
    " }
    "
    "
    " let g:netrw_banner = 0
    " let g:netrw_liststyle = 3
    " let g:netrw_browse_split = 4
    " let g:netrw_altv = 1
    " let g:netrw_winsize = 25
    " augroup ProjectDrawer
    " autocmd!
    " autocmd VimEnter * :Vexplore
    " augroup END

"}
