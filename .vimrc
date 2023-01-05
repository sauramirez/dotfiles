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
Plug 'Lokaltog/powerline'
Plug 'altercation/vim-colors-solarized'
Plug 'sheerun/vim-polyglot'
Plug 'evanleck/vim-svelte'
Plug 'dense-analysis/ale'
Plug 'posva/vim-vue'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'
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
        let g:solarized_termcolors=256
        set background=dark
        colorscheme solarized
    endif

    set guifont=Fira\ Mono:h12
    "set guifont=Dank\ Mono\ Regular:h14
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
    set re=2

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
    set tabstop=2             " tab spacing
    set softtabstop=2         " unify
    set shiftwidth=2          " indent/outdent by 4 columns
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
        let g:flake8_ignore="E501,W503"
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
                    \   'dart': ['dartfmt'],
                    \}
        let g:ale_fix_on_save = 1
        let g:ale_pattern_options = {'\.dart$': {'ale_enabled': 0}}
        let g:dartfmt_options = ['--fix', '-l 120']
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
        nnoremap <silent> <leader>gs :Git<CR>
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
        autocmd FileType javascript setlocal ts=2 sts=2 sw=2
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

    " let g:polyglot_disabled = ['javascript']
    "
    " Coc {
    " Some servers have issues with backup files, see #649.
    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
                \ coc#pum#visible() ? coc#pum#next(1):
                \ CheckBackspace() ? "\<Tab>" :
                \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice.
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
    else
        inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call ShowDocumentation()<CR>

    function! ShowDocumentation()
        if CocAction('hasProvider', 'hover')
            call CocActionAsync('doHover')
        else
            call feedkeys('K', 'in')
        endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Run the Code Lens action on the current line.
    nmap <leader>cl  <Plug>(coc-codelens-action)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Remap <C-f> and <C-b> for scroll float windows/popups.
    if has('nvim-0.4.0') || has('patch-8.2.0750')
        nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
        nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
        inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
        inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
        vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
        vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif

    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of language server.
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocActionAsync('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
    " }
"}
