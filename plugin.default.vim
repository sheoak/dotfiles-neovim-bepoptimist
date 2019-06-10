""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins configuration
" mappings are in mapping.vim
"
" Some plugin may not be installed, but I keep the settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Python configuration (neovim 2 & 3 virtualenv must be created)
let g:python_host_prog=expand('~/.virtualenvs/neovim2/bin/python')
let g:python3_host_prog=expand('~/.virtualenvs/neovim3/bin/python')

" Emmet
let g:user_emmet_install_global = 0

" ALE
let g:ale_fixers = ['prettier', 'stylelint', 'eslint', 'autopep8', 'yapf',
            \   'remove_trailing_lines', 'trim_whitespace' ]
let b:ale_warn_about_trailing_whitespace = 0

" vim-rooter
let g:rooter_patterns = ['Rakefile', '.git/', 'package.json', '.projectroot']
let g:rooter_silent_chdir = 1

" vim-airline
set laststatus=2 " Always display the statusline in all windows
set noshowmode   " Remove the duplicated mode label

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t' " just show filename
let g:airline#extensions#tabline#fnamecollapse = 0
" syntax not 100% correct, but faster, refresh with :AirlineRefresh :
let g:airline_highlighting_cache = 1
" do not show default correct utf-8 unix status
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" Icons and labels:
let g:airline#extensions#obsession#indicator_text = ''
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'c'  : ' command',
      \ 'i'  : ' insert',
      \ 'ic' : ' insert',
      \ 'ix' : ' insert',
      \ 'n'  : ' normal',
      \ 'ni' : ' normal',
      \ 'no' : ' normal',
      \ 'R'  : '﯒ replace',
      \ 'Rv' : '﯒ replace',
      \ 's'  : ' select',
      \ 'S'  : ' select',
      \ '' : ' select',
      \ 't'  : ' terminal',
      \ 'v'  : ' visual',
      \ 'V'  : ' visual Line',
      \ '' : ' visual Block',
\ }

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.readonly = ""
let g:airline_symbols.spell = '暈'
let g:airline_symbols.paste = ''

" theme gruvbox
let g:gruvbox_contrast_light = 'light'

" vim-template
" Try to get email and name from git
let g:email=system("echo -n `git config --list | grep user.email | head -n 1 | cut -d'=' -f2`")
let g:username=system("echo -n `git config --list | grep user.name | cut -d'=' -f2`")

let g:snips_author = username . "<" . email . ">"

" vim-pandoc
let g:pandoc#biblio#sources = 'b'

" Gundo
let g:gundo_prefer_python3 = 1

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#sources = {}
let g:deoplete#sources._ = []
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#auto_complete_delay = 100

" Goyo
let g:goyo_height='98%'
let g:goyo_width=80
let g:goyo_linenr=1

" Ranger
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory

" Neosnippets
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.local/share/nvim/plugged/vim-snippets/snippet'

let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['python'] = 'python,django'

" Gutentag
let g:gutentags_ctags_tagfile=".ctags"
let g:gutentags_exclude_project_root=['/etc']

" vim-markdown
let g:mkdp_browser = 'qutebrowser'

" Git-gutter
set updatetime=100

" Grammarous
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0, 'text' : 0
            \ }
let g:grammarous#use_vim_spelllang = 1

" Devicons
let g:webdevicons_enable_denite = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

" Sneak
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1
let g:sneak#prompt = '❯'
let g:sneak#label = 0

" Startify
let g:bookmark_auto_save_file = $DOTFILES_PRIVATE . '/nvim/vim-bookmarks'
let g:startify_custom_header = []

" " vim-multiple-cursors
" let g:multi_cursor_start_word_key      = '<C-h>'
" let g:multi_cursor_select_all_word_key = '<A-n>'
" let g:multi_cursor_start_key           = 'g<C-h>'
" let g:multi_cursor_select_all_key      = 'g<A-h>'
" let g:multi_cursor_next_key            = '<C-h>'
" let g:multi_cursor_prev_key            = '<C-p>'
" let g:multi_cursor_skip_key            = '<C-x>'
" let g:multi_cursor_quit_key            = '<Esc>'

" Ternjs
let g:deoplete#sources#ternjs#filetypes = ['jsx', 'vue']

" vim-unimpaired-extras
if (executable('ag'))
    let g:unimpaired_extra_denite_cmd_hidden = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
    let g:unimpaired_extra_denite_cmd = ['ag', '--follow', '--nocolor', '--nogroup', '-g', '']
endif

" FZF
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
autocmd  BufLeave *   set laststatus=2 ruler
