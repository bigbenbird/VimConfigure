"vundle begin
set nocompatible " be iMproved
filetype off  "required!

if has('win32') || has('win64')
	set rtp^=~/.vim/
	set rtp+=~/.vim/vimfiles/bundle/vundle/
	call vundle#rc('$HOME/.vim/vimfiles/bundle')
else
	" Usual quickstart instructions
	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc()
endif


" let Vundle manage plugins
" required! 
Bundle 'gmarik/vundle'
Bundle 'AutoComplPop'


" vim-scripts.org repos
Bundle 'OmniCppComplete'
Bundle 'The-NERD-tree'
Bundle 'taglist.vim'
Bundle 'Tagbar'
Bundle 'ctrlp.vim'
Bundle 'minibufexpl.vim'
Bundle 'bufexplorer.zip'
Bundle 'tomasr/molokai'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'grep.vim'
Bundle 'ack.vim'
Bundle 'javabrowser'
"Bundle 'Vim-JDE'
Bundle 'auto-pairs'
Bundle 'SuperTab-continued.'
"Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
"Bundle 'vim-latex-suite'
"Bundle 'LaTex-Box'
"Bundle 'auctex.vim'
Bundle "LaTeX-Suite-aka-Vim-LaTeX"

filetype plugin indent on     " required! 
let NERDTreeDirArrows=0
" vundle end

" personal setting
set cindent      " c indent
set nu           " line number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set cursorline   " cursor line
" hi cursorline ctermbg=darkred ctermfg=white
set mouse=nv     " enable mouse action in normal/visual mode
set hidden       " allow buffer switch without save
syntax on		 " turn on syntax highlight

" colorscheme desert
colorscheme molokai 

" Font for GUI
if has('gui_running')
	set guifont=Consolas:h11:cANSI
endif

" For search highlight
set hlsearch
noremap <silent> <Space> :noh<Bar>:echo<CR>

let mapleader=","

" For quick window navigation
"map <leader>h :wincmd h<CR>
"map <leader>j :wincmd j<CR>
"map <leader>k :wincmd k<CR>
"map <leader>l :wincmd l<CR> 
" nnoremap <C-h> <C-W>h
" nnoremap <C-j> <C-W>j
" nnoremap <C-k> <C-W>k
" nnoremap <C-l> <C-W>l
"noremap <silent> <F4> :bp<CR>
"noremap <silent> <F5> :bn<CR>
if has("gui_running") || (&term == "win32") || (&term == "pcterm") 
	noremap <C-Left> :bn<CR>
	noremap <C-Right> :bp<CR>
else
	noremap <Esc>[D :bp<CR>
	noremap <Esc>[C :bn<CR>
endif

" Quick close all window
map <leader>qq :qall<CR>

" For quick replace
map <leader>s :%s/\(<c-r>=expand("<cword>")<cr>\)/

" For omnicomplete
let OmniCpp_NamespaceSearch = 1      
let OmniCpp_GlobalScopeSearch = 1      
let OmniCpp_ShowScopeInAbbr = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_ShowAccess = 1      
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1      
let OmniCpp_MayCompleteScope = 1      
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" Do not show preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" For NERDTree plugin
autocmd vimenter * NERDTree
map <leader>t :NERDTreeToggle<CR>
"let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
" Used by winmanager
" let g:NERDTree_title="[NERDTree]"
" function! NERDTree_Start()
"     exe 'NERDTree'
" endfunction
" 
" function! NERDTree_IsValid()
"     return 1
" endfunction

" For Tagbar plugin
noremap <silent> <F9> :TagbarToggle<CR>

" For TagList plugin
" filetype plugin on
noremap <silent> <F10> :TlistToggle<CR>
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=40
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1

" For BufExplorer shortcut key
noremap <silent> <F11> :BufExplorer<CR>

" For MiniBufExplorer
let g:miniBufExplorerAutoUpdate = 1 
"let g:miniBufExplVSplit = 20   " column width in chars
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapAltVimSwitchBufs = 1
let g:miniBufExplMapCTabSwitchBufs = 1
" hot key for toggle minibufexplorer
noremap <leader>m :TMiniBufExplorer<CR>
" Used by winmanager
" let g:MiniBufExplorer_title="[MiniBufExplorer]"
" function! MiniBufExplorer_Start()
" 	exe 'MiniBufExplorer'
" endfunction
" 
" function! MiniBufExplorer_IsValid()
" 	return 1
" endfunction

" For ctags
set tags+=~/.vim/tagfiles/stl_tags
map <F12> :!ctags -R --exclude=="*/.svn" --sort=yes --c++-kinds=+p --fields=+ialS --extra=+q .<CR> <CR>

" For CtrlP Plugin
"let g:ctrlp_working_path_mode=1
let g:ctrlp_by_filename=1
let g:ctrlp_custom_ignore={
	\ 'dir': '\.git$\|\.hg$\|\.svn$\|build$\|deps$\|lib$\|release$\|debug$',
	\}

" For powerline
if !has('win32') && !has('win64')
	set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
	let g:Powerline_symbols = 'fancy'
endif

if ! has("gui_running")
	set t_Co=256
endif
if &diff
	set background=dark
	colors peaksea
endif

noremap <silent> <F7> :JavaBrowser<CR>
let JavaBrowser_Ctags_Cmd='/usr/bin/ctags'
let JavaBrowser_User_Highlight_Tag=1

let g:atp_tab_amp=1

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
"
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash
"
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='xelatex'
" "
let g:Tex_ViewRule_pdf='/Applications/Skim.app/Contents/MacOS/Skim'

"let g:Tex_FormatDependency_pdf='pdf' 


let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_MultipleCompileFormats='pdf,aux'

"let g:tex_flavor="xelatex"
let g:Tex_CompileRule_pdf='xelatex --interaction=nonstopmode $*'



"Vim JDE
" For windows mangaer
" let g:winManagerWindowLayout = 'NERDTree|BufExplorer'
" nmap <silent> <F8> :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>

"let g:clang_auto_select=1
"let g:clang_complete_auto=1
"let g:clang_complete_copen=1
"let g:clang_hl_errors=1
"let g:clang_complete_macros=1
"let g:clang_complete_patterns=0
"let g:clang_use_library=1
"let g:clang_library_path="/usr/lib/"
"let g:clang_user_options=""
"let g:clang_auto_user_options="path, .clang_complete"
