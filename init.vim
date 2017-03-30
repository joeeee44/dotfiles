if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath^=/Users/joe/.config/nvim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('/Users/joe/.config/nvim/dein'))

" call dein#add('SpaceVim/SpaceVim')

call dein#add('Shougo/dein.vim')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/deoplete.nvim')
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.]*'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

call dein#add('joshdick/onedark.vim')
colorscheme onedark
let g:onedark_termcolors=256
syntax on
" :so $VIMRUNTIME/syntax/colortest.vim
" :so $VIMRUNTIME/syntax/hitest.vim
set cursorline
hi CursorLine ctermbg=232
set cursorcolumn
hi CursorColumn ctermbg=232
set number
hi CursorLineNr term=bold cterm=NONE ctermfg=196 ctermbg=NONE

call dein#add('othree/html5.vim')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('lilydjwg/colorizer')
" :ColorHighlight	- start/update highlighting
" :ColorClear      - clear all highlights
" :ColorToggle     - toggle highlights
" call dein#add('unite-webcolorname') #error
call dein#add('jelera/vim-javascript-syntax')

" ESLint StyleLint
call dein#add('w0rp/ale')
call dein#add('posva/vim-vue')
let g:ale_linters = {
      \ 'html': [],
      \ 'css': ['stylelint'],
      \ 'javascript': ['eslint'],
      \ 'vue': ['eslint']
      \ }
let g:ale_linter_aliases = {'vue': 'css'}
let g:ale_open_list = 0
let g:ale_statusline_format = ['E%d', 'W%d', '']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" :ALELint

call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')

call dein#add('mattn/emmet-vim')
autocmd FileType html,css,scss,pug,jade,ejs,erb imap <buffer><expr><tab>
   \ emmet#isExpandable() ? "\<plug>(emmet-expand-abbr)" :
   \ "\<tab>"

call dein#add('Shougo/vimfiler.vim')
nnoremap :ff :VimFiler

call dein#add('scrooloose/nerdtree')
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('Xuyuanp/nerdtree-git-plugin')
let g:NERDTreeShowBookmarks=1
autocmd vimenter * NERDTree
let NERDTreeShowHidden = 1
nnoremap <silent><C-e> :NERDTreeFocusToggle
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
nnoremap :ss :NERDTreeToggle
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')

call dein#add('vim-scripts/taglist.vim')
call dein#add('szw/vim-tags')
set tags=tags
" let Tlist_Ctags_Cmd = "/usr/bin/ctags" // Macの場合コメントアウト
let g:tlist_javascript_settings = 'js;o:object;f:function'
let g:tlist_php_settings        = 'php;c:class;f:function;d:constant'
let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let g:Tlist_WinWidth = 35
let Tlist_Exit_OnlyWindow = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Display_Prototype = 1
let Tlist_Compact_Format = 0

call dein#add('mbbill/undotree')
nnoremap :ut :UndotreeToggle
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 'topleft'
let g:undotree_SplitWidth = 35
let g:undotree_diffAutoOpen = 1
let g:undotree_diffpanelHeight = 25
let g:undotree_RelativeTimestamp = 1
let g:undotree_TreeNodeShape = '*'
let g:undotree_HighlightChangedText = 1
let g:undotree_HighlightSyntax = "UnderLined"

call dein#add('easymotion/vim-easymotion')
nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-bd-f2)

" call dein#add('haya14busa/incsearch.vim')
" call dein#add('haya14busa/incsearch-easymotion.vim')
" function! s:incsearch_config(...) abort
"   return incsearch#util#deepextend(deepcopy({
"   \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
"   \   'keymap': {
"   \     "\<CR>": '<Over>(easymotion)'
"   \   },
"   \   'is_expr': 0
"   \ }), get(a:, 1, {}))
" endfunction
" noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
" noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
" noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

call dein#add('terryma/vim-multiple-cursors')
nnoremap :mmm :MultipleCursorsFind
vnoremap :mmm :MultipleCursorsFind

" call dein#add('ctrlpvim/ctrlp.vim')
set rtp+=~/.fzf
nnoremap <C-t> :call fzf#run({'sink': 'edit'})

call dein#add('vim-scripts/grep.vim')
" :Rgrep

call dein#add('Shougo/context_filetype.vim')
call dein#add('osyo-manga/vim-precious')
autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html

call dein#add('mattn/excitetranslate-vim')
call dein#add('mattn/webapi-vim')
nnoremap :et :ExciteTranslate
vnoremap :et :ExciteTranslate

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'

call dein#add('tpope/vim-fugitive')
let g:airline#extensions#branch#enabled = 1
" git add % => :Gwrite
" git status => :Gstatus "[-]add [D]Gblame
" git commit => :Gcommit -m 'xxx'
" git push => :Git push
" :Gdiff
"   do 取込, dp 書出
" :Gblame
" :Glog
" :Git log

call dein#add('airblade/vim-gitgutter')

" call dein#add('edkolev/tmuxline.vim')

call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

call dein#add('thinca/vim-quickrun')
" let g:quickrun_config={'_': {'split': 'vertical'}}
" set splitbelow
set splitright
" let g:quickrun_config['markdown'] = {
"   \   'outputter': 'browser'
"   \ }
" :echo &filetype or :set filetype?
" :setfiletype ***
" \r
" .ex
" 3.times do
"   puts "Hello ruby!"
" end
" :setfiletype ruby
" \r

call dein#add('tomtom/tcomment_vim')

call dein#add('nathanaelkane/vim-indent-guides')
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=238

call dein#add('vim-scripts/AnsiEsc.vim')
" :Ansiesc

call dein#add('bronson/vim-trailing-whitespace')

" call dein#add('yuratomo/gmail.vim')

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
" set cindent
" set smartcase
set ignorecase
set noswapfile
set whichwrap=b,s,h,l,<,>,[,]

augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.py setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

nnoremap ff <C-w>
inoremap ee <Esc>
vnoremap ee <Esc>

nnoremap <C-j> }
nnoremap <C-k> {

inoremap {<Enter> {<Enter>}<Esc><S-o>
inoremap [<Enter> [<Enter>]<Esc><S-o>
inoremap (<Enter> (<Enter>)<Esc><S-o>

nnoremap > <C-w>5>
nnoremap < <C-w>5<
nnoremap + <C-w>5+
nnoremap - <C-w>5-

set clipboard&
set clipboard^=unnamedplus

" esc → us
if executable('osascript')
  let s:keycode_jis_eisuu = 102
  let g:force_alphanumeric_input_command = "osascript -e 'tell application \"System Events\" to key code " . s:keycode_jis_eisuu . "' &"
  inoremap   :call system(g:force_alphanumeric_input_command)
  autocmd! FocusGained *
    \ call system(g:force_alphanumeric_input_command)
endif

call dein#end()
if dein#check_install()
  call dein#install()
endif
