call plug#begin('~/.vim/plugged')
syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'Lokaltog/vim-easymotion'
Plug 'myusuf3/numbers.vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-pathogen'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/syntastic'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/neocomplcache'
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/django.vim'
Plug 'groenewege/vim-less'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'elzr/vim-json'
Plug 'wting/rust.vim'
Plug 'lepture/vim-jinja'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'Lokaltog/powerline'
Plug 'altercation/vim-colors-solarized'
" Add plugins to &runtimepath
call plug#end()

" Vim settings {
    syntax enable
    let mapleader = ","
    set bs=2
    "if has('gui_running')
        "set background=light
    "else
        "set background=light
    "endif
    "colorscheme solarized

    "set guifont=Fira\ Mono:h12
    set guifont=Source\ Code\ Pro:h12
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
        let g:flake8_ignore=""
        map <C-f> :call Flake8()
        "autocmd BufWritePost *.py call Flake8()
    " }

    " Syntastic {
       set statusline+=%#warningmsg#
       set statusline+=%{SyntasticStatuslineFlag()}
       set statusline+=%*

       let g:syntastic_always_populate_loc_list = 1
       let g:syntastic_auto_loc_list = 1
       let g:syntastic_check_on_open = 0
       let g:syntastic_always_populate_loc_list = 1
    "   let g:syntastic_check_on_wq = 0
    "   let g:syntastic_python_flake8_args=''
       let g:syntastic_javascript_checkers = ['jshint']
        " --ignore=E503
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

"}
