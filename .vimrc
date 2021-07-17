"vundle begin
set nocompatible " be iMproved
filetype off  "required!
set ts=4
set pyxversion=3
set expandtab
"set clipboard=unnamedplus
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

if has('win32') || has('win64')
	set rtp^=~/.vim/
	set rtp+=~/.vim/vimfiles/bundle/vundle/
	call vundle#rc('$HOME/.vim/vimfiles/bundle')
else
	" Usual quickstart instructions
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
endif
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end
" let Vundle manage plugins
" required! 
Plugin 'VundleVim/Vundle.vim'
"Bundle 'AutoComplPop'
"Bundle 'othree/vim-autocomplpop'
Bundle 'L9'

" vim-scripts.org repos
Bundle 'OmniCppComplete'
if has('nvim')
  Bundle 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Bundle 'Shougo/deoplete.nvim'
  Bundle 'roxma/nvim-yarp'
  Bundle 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
"Bundle 'christoomey/vim-system-copy'
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
"Bundle 'EasyClip'
"Bundle 'Vim-JDE'
Bundle 'auto-pairs'
Bundle 'SuperTab-continued'
"Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
"Bundle 'vim-latex-suite'
"Bundle 'LaTex-Box'
"Bundle 'auctex.vim'
Bundle "LaTeX-Suite-aka-Vim-LaTeX"
call vundle#end()

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 1
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <expr><CR> pumvisible()? "\<C-y>" : "\<CR>"
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
set backspace=indent,eol,start
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"filetype plugin indent on     " required! 
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
imap <C-space> <Plug>IMAP_JumpForward
nmap <C-space> <Plug>IMAP_JumpForward
vmap <C-space> <Plug>IMAP_JumpForward

let mapleader=","

" For quick window navigation
"map <leader>h :wincmd h<CR>
"map <leader>j :wincmd j<CR>
"map <leader>k :wincmd k<CR>
"map <leader>l :wincmd l<CR> 
"nnoremap <C-h> <C-W>h
"nnoremap <C-j> <C-W>j
"nnoremap <C-k> <C-W>k
"nnoremap <C-l> <C-W>l
"noremap <silent> <F4> :bp<CR>
"noremap <silent> <F5> :bn<CR>
if has("gui_running") || (&term == "win32") || (&term == "pcterm") 
	noremap <C-Left> :bn<CR>
	noremap <C-Right> :bp<CR>
"press Ctrl+v and then presss any key of keyborad under the insert mode, vim
"sill diaplay the signal it recesived
elseif (&term == "xterm")
	noremap <Esc>[1;5D :bp<CR> 
	noremap <Esc>[1;5C :bn<CR> 
elseif (&term == "xterm-256color")
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


let g:miniBufExplMapWindowNavVim = 1

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
"进行版权声明的设置
""添加或更新头
map <F4> :call TitleDet()<cr>'s
function AddTitle()
	    call append(0,"/*=============================================================================")
	    call append(1,"#")
	    call append(2,"# Author: Jianpeng Li")
	    call append(3,"#")
	    call append(4,"# E-Mail: limoonbird@gmail.com")
	    call append(5,"#")
	    call append(6,"# Create on: ".strftime("%Y-%m-%d %H:%M"))
	    call append(7,"#")
	    call append(8,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
	    call append(9,"#")
	    call append(10,"# Filename: ".expand("%:t"))
	    call append(11,"#")
		call append(12,"# For the brave souls who get this far: You are the chosen ones,")
		call append(13,"# the valiant knights of programming who toil away, without rest,")
		call append(14,"# fixing our most awful code. To you, true saviors, kings of men,")
		call append(15,"# I say this: never gonna give you up, never gonna let you down,")
		call append(16,"# never gonna run around and desert you. Never gonna make you cry,")
		call append(17,"# never gonna say goodbye. Never gonna tell a lie and hurt you.")
		call append(18,"=============================================================================*/")
		echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf 
"更新最近修改时间和文件名
function UpdateTitle()
    normal m'
	execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
	normal ''
	normal mk
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
"判断前10行代码里面，是否有Last modified这个单词，
""如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet()
	let n=1
    "默认为添加
    while n < 10
		let line = getline(n)
		if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
			call UpdateTitle()
            return
        endif
        let n = n+ 1
    endwhile
    call AddTitle()
endfunction

