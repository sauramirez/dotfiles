set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'myusuf3/numbers.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-pathogen'
Bundle 'scrooloose/syntastic'
Bundle 'mattn/zencoding-vim'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'nvie/vim-flake8'
Bundle 'vim-scripts/django.vim'
Bundle 'groenewege/vim-less'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate'

filetype plugin indent on     " required!

" Vim settigs {

    syntax enable
    let mapleader = ","
    set bs=2
    let g:solarized_termcolors=16
    if has('gui_running')
        set background=dark "light
    else
        set background=dark
    endif
    colorscheme solarized

    "set guifont=Source\ Code\ Pro:h12
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
    " set t_Co=256              " enable 256-color mode.
    " syntax enable             " enable syntax highlighting (previously
    " syntax on).
    " colorscheme molokai       " set colorscheme
    "
    " " Prettify JSON files
    autocmd BufRead,BufNewFile *.json set filetype=json
    autocmd Syntax json sou ~/.vim/syntax/json.vim
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

    " Ctrlp {
        let g:ctrlp_working_path_mode = 2
        set wildignore+=*.pyc
        nnoremap <silent> <D-t> :CtrlP<CR>
        nnoremap <silent> <D-r> :Ctr

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
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>ga :Gwrite<CR>
        nnoremap <silent> <leader>go :diffoff<CR>
    " }

    " neocomplcache {
        imap <C-k>     <Plug>(neocomplcache_snippets_expand)
        smap <C-k>     <Plug>(neosnippet_expand_or_jump)

        " Enable omni completion. Not required if they are already set
        " elsewhere in .vimrc
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    " }

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
        let g:flake8_ignore="E501,W293"
        map <C-f> :call Flake8()
        "autocmd BufWritePost *.py call Flake8()
    " }

    " Syntastic {
        let g:syntastic_python_flake8_args='--ignore=E501'
    " }
    "
    " Dash {
        " Search Dash for word under cursor
        function! SearchDash()
            let s:browser = "/usr/bin/open"
            let s:wordUnderCursor = expand("<cword>")
            let s:url = "dash://".s:wordUnderCursor
            let s:cmd ="silent ! " . s:browser . " " . s:url
            execute s:cmd
            redraw!
        endfunction
        map <leader>d :call SearchDash()<CR>
    " }
    "
    " PEP8 {
        map <leader><leader>p :! autopep8 --in-place %<CR>
    " }
" }

