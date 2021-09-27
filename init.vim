"__     ___   _   _   _  ____ _   ___   _______ _   _    ____ ___  ____  _____ ____  
"\ \   / / | | | | \ | |/ ___| | | \ \ / / ____| \ | |  / ___/ _ \|  _ \| ____|  _ \ 
" \ \ / /| | | | |  \| | |  _| | | |\ V /|  _| |  \| | | |  | | | | | | |  _| | |_) |
"  \ V / | |_| | | |\  | |_| | |_| | | | | |___| |\  | | |__| |_| | |_| | |___|  _ < 
"   \_/   \___/  |_| \_|\____|\___/  |_| |_____|_| \_|  \____\___/|____/|_____|_| \_\
" 
" Vim customized by Vu Nguyen Coder
" (See my detailed tutorial here: https://youtu.be/Tp8i1EHsQ1Q )
"
" http://youtube.com/VuNguyenCoder
" http://facebook.com/VuNguyenCoder

" Global path
if has('win32')
	" Window 10
	let nvim_config_dir = '~/AppData/Local/nvim/'
else
	" Unix/Linux 
	let nvim_config_dir = '~/.config/nvim/'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a 				" Enable mouse
set tabstop=4 				" 
set shiftwidth=4 			" 
set listchars=tab:\¦\ 		" Tab charactor 
set list
set foldmethod=indent 		" 
set foldlevelstart=99 		"  
set number 					" Show line number
set ignorecase 				" Enable case-sensitive 

" Disable backup
set nobackup
set nowb
set noswapfile

syntax on

" Enable copying from vim to clipboard
if has('win32')
  set clipboard=unnamed 		 
else
  set clipboard=unnamedplus
endif

" Auto reload content changed outside
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Resize pane
nmap <M-Right> :vertical resize +1<CR> 		
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>

" Search a hightlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin list
" (used for Vim-plug - https://github.com/junegunn/vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin(nvim_config_dir.'plugged')
" Theme
  Plug 'joshdick/onedark.vim', 						" Dark theme

" File browser
  Plug 'preservim/nerdTree' 						" File browser  
  Plug 'Xuyuanp/nerdtree-git-plugin' 				" Git status
  Plug 'ryanoasis/vim-devicons' 					" Icon
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'unkiwii/vim-nerdtree-sync' 					" Sync current file 

" File search
  Plug 'junegunn/fzf', 
  	\ { 'do': { -> fzf#install() } } 				" Fuzzy finder 
  Plug 'junegunn/fzf.vim'

" Status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

" Terminal
  Plug 'voldikss/vim-floaterm' 						" Float terminal

" Code intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'} 	" Language server 
  Plug 'jiangmiao/auto-pairs' 						" Parenthesis auto 
  Plug 'alvan/vim-closetag'
  Plug 'mattn/emmet-vim' 
  Plug 'preservim/nerdcommenter' 					" Comment code 
  Plug 'liuchengxu/vista.vim' 						" Function tag bar 

" Code syntax highlight
  Plug 'yuezk/vim-js' 								" Javascript
  Plug 'MaxMEllon/vim-jsx-pretty' 					" JSX/React
  Plug 'jackguo380/vim-lsp-cxx-highlight'			" C++ syntax
  Plug 'uiiaoo/java-syntax.vim' 					" Java 
  
" Debugging
  Plug 'puremourning/vimspector' 					" Vimspector

" Source code version control 
  Plug 'tpope/vim-fugitive' 						" Git
	
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set theme 
colorscheme onedark

" Overwrite some color highlight 
if (has("autocmd"))
  augroup colorextend
  	autocmd ColorScheme * call onedark#extend_highlight("Comment", { "fg": { "gui": "#728083" } })
  	autocmd ColorScheme * call onedark#extend_highlight("LineNr", { "fg": { "gui": "#728083" } })
  augroup END
endif

" Set code syntax hightlight 
let g:javascript_plugin_jsdoc = 1

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Other setting 
let nvim_plugin_settings_dir = nvim_config_dir.'settings/'
execute 'source '.nvim_plugin_settings_dir.'airline.vim'
execute 'source '.nvim_plugin_settings_dir.'coc.vim'
execute 'source '.nvim_plugin_settings_dir.'floaterm.vim'
execute 'source '.nvim_plugin_settings_dir.'nerdtree.vim'
execute 'source '.nvim_plugin_settings_dir.'fzf.vim'
execute 'source '.nvim_plugin_settings_dir.'vimspector.vim'
execute 'source '.nvim_plugin_settings_dir.'nerdcommenter.vim'
execute 'source '.nvim_plugin_settings_dir.'vista.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other scripts 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
let nvim_scripts_dir = nvim_config_dir.'scripts/'

" Enable auto close HTML tag
let g:closetag_html_style=1
execute 'source '.nvim_scripts_dir.'closetag.vim'
