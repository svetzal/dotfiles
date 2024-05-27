set nocompatible
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set hidden
set relativenumber
set number
set undofile
set spell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set wrap
set linebreak
set list
set listchars=tab:›\ ,trail:•
" set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set confirm
set exrc
set textwidth=100
set colorcolumn=100
highlight ColorColumn guibg=Black
highlight ColorColumn ctermbg=Black

" set cc=120
set cursorline

let mapleader = ";"
map <leader>k :nohlsearch<CR>

map gf :edit <cfile><CR>

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
  source ~/.config/nvim/plugins/icons.vim
  source ~/.config/nvim/plugins/lualine.vim
"   source ~/.config/nvim/plugins/lspconfig.vim
  source ~/.config/nvim/plugins/compe.vim
  source ~/.config/nvim/plugins/plenary.vim
  source ~/.config/nvim/plugins/popup.vim
  source ~/.config/nvim/plugins/surround.vim
  source ~/.config/nvim/plugins/commentary.vim
"  source ~/.config/nvim/plugins/gruvbox.vim
  source ~/.config/nvim/plugins/dracula.vim
  source ~/.config/nvim/plugins/fzf.vim
  source ~/.config/nvim/plugins/fugitive.vim
  source ~/.config/nvim/plugins/nerdtree.vim
call plug#end()

autocmd VimEnter * ++nested colorscheme dracula

" lua require("lsp-config")
lua require('lualine').setup({ theme = 'dracula' })

