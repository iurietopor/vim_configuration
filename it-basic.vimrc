" file_name: it-basic.vimrc
" author: IT
"
"""""""""""

" BASICS ---------------------------------------------------------------- {{{

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Set shift width to 4 spaces.
set shiftwidth=2

" Set tab width to 4 columns.
set tabstop=2

" Use space characters instead of tabs.
"set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

""wildmenu
" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" }}}

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

	" BASICS
	"
  Plug 'dense-analysis/ale' " syntax checking and semantic errors

  Plug 'preservim/nerdtree' " file system explorer for the Vim editor
 	

	" CUSTUM	
  " 1. YouCompleteMe
  Plug 'Valloric/YouCompleteMe'

  " 2. Ansible
  Plug 'pearofducks/ansible-vim'

  " 3. Terraform
  Plug 'hashivim/vim-terraform'

  " 4. Commentary
	Plug 'tpope/vim-commentary'

	" 5. Vim-Airline
	Plug 'vim-airline/vim-airline' " Lean & mean status/tabline for vim
	Plug 'vim-airline/vim-airline-themes' " the official theme repository for vim-airline
	
	" 6. Markdown
	Plug 'goodlygeek/tabular' " auto-line up text
	Plug 'preservim/vim-markdown' 

call plug#end()

" }}}

" PLUGIN'S config ---------------------------------------------------------------- {{{

  " 1. YouCompleteMe
  let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
  let g:ycm_confirm_extra_conf=0
  let g:ycm_python_binary_path='/usr/bin/python3'

  " 2. Ansible
  let g:ansible_unindent_after_newline = 1
  let g:ansible_yamlKeyName = 'yamlKey'
  let g:ansible_attribute_highlight = "ob"
  let g:ansible_name_highlight = 'd'
  let g:ansible_extra_keywords_highlight = 1
  let g:ansible_extra_keywords_highlight_group = 'Statement'
  let g:ansible_normal_keywords_highlight = 'Constant'
  let g:ansible_loop_keywords_highlight = 'Constant'
  let g:ansible_template_syntaxes = { '*.rb.j2': 'ruby' }
  let g:ansible_ftdetect_filename_regex = '\v(playbook|site|main|local|requirements)\.ya?ml$'

  " 3. Terraform
  let g:terraform_fmt_on_save=1
  let g:terraform_align=1

  " 4.
	
	" 5.1 VIM-AIRLINE 
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#left_sep = ' '
	let g:airline#extensions#tabline#left_alt_sep = '|'
	" let g:airline#extensions#tabline#formatter = 'default'
	" 5.2 VIM-AIRLINE-THEME
	let g:airline_theme='simple'

	" 6 MARKDOWN

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

	" MAPPINGS Basic -------------------------------------------------------- {{{
	
		" nnoremap – Allows you to map keys in normal mode.
		" inoremap – Allows you to map keys in insert mode.
		" vnoremap – Allows you to map keys in visual mode.
	 
		inoremap jj <esc>
		
		nnoremap <space> :
		nnoremap o o<esc>
		nnoremap O O<esc>

		" Map the F5 key to run a Python script inside Vim.
		" I map F5 to a chain of commands here.
		" :w saves the file.
		" <CR> (carriage return) is like pressing the enter key.
		" !clear runs the external clear screen command.
		" !python3 % executes the current file with Python.
		"nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>  

		" You can split the window in Vim by typing :split or :vsplit.
		" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
		nnoremap <c-j> <c-w>j
		nnoremap <c-k> <c-w>k
		nnoremap <c-h> <c-w>h
		nnoremap <c-l> <c-w>l

		" Resize split windows using arrow keys by pressing:
		" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
		noremap <c-up> <c-w>+
		noremap <c-down> <c-w>-
		noremap <c-left> <c-w>>
		noremap <c-right> <c-w><
		
		" Unhighlitght prevois serch
		nnoremap ## :nohighlight	
		
	" }}}


	" " NERDTree {{{

		" NERDTree specific mappings.
		" Map the F3 key to toggle NERDTree open and close.
		nnoremap <F3> :NERDTreeToggle<cr>

		" Have nerdtree ignore certain files and directories.
		let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

	" }}}
  
" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

  " This will enable code folding.
  " Use the marker method of folding.
  augroup filetype_vim
	  autocmd!
	  autocmd FileType vim setlocal foldmethod=marker
  augroup END

  " If the current file type is HTML, set indentation to 2 spaces.
  autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

  " If Vim version is equal to or greater than 7.3 enable undofile.
  " This allows you to undo changes to a file even after saving it.
  if version >= 703
	  set undodir=~/.vim/backup
	  set undofile
	  set undoreload=10000
  endif

  "" 2. For ANSIBLE
  autocmd FileType yaml setlocal et ts=2 ai sw=2 nu sts=0

  "" 3. For TERRAFORM
  autocmd BufEnter *.tf* colorscheme icansee

	"" 4. For COMMENTARY
	autocmd FileType py,tf,yaml,yml,sh setlocal commentstring=#\ %s 

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}
