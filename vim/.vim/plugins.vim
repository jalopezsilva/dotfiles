" Plugins


Plug 'tpope/vim-sensible'              " Sensible vim defaults.


" Languages


Plug 'sheerun/vim-polyglot'            " Language pack for vim
Plug 'tmux-plugins/vim-tmux'           " tmux filetype.


" Autocompletion


Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " More snippets.
Plug 'jiangmiao/auto-pairs'                         " Automatically generate pairs.
Plug 'Shougo/deoplete.nvim'                         " Fancy autocompletion engine.
Plug 'roxma/nvim-yarp'                              " Compatibility layer for nvim
Plug 'roxma/vim-hug-neovim-rpc'                     " Compatibility layer for nvim


" Commands, Movement.


Plug 'junegunn/vim-easy-align'         " Epic tabulation.
Plug 'szw/vim-g'                       " Google Search.
Plug 'tommcdo/vim-exchange'            " Exchange motion. {cx}
Plug 'tpope/vim-abolish'               " Subvert goodness.
Plug 'tpope/vim-commentary'            " Commenting.
Plug 'tpope/vim-eunuch'                " Unix utils.
Plug 'tpope/vim-surround'              " Wrap around text easily.
Plug 'tpope/vim-unimpaired'            " Must-have mappings.

" IDE-like improvements.


Plug 'junegunn/goyo.vim'               " Lovely text editing.
Plug 'myusuf3/numbers.vim'             " Toggle between num, relativenum.
Plug 'sjl/gundo.vim'                   " Undo tree magic.
Plug 'vim-airline/vim-airline'         " Beautiful status line.
Plug 'vim-airline/vim-airline-themes'
Plug 'ludovicchabant/vim-lawrencium'   " Awesome mercurial integration.
Plug 'tpope/vim-fugitive'              " Awesome git integration.



" vim Extensions


Plug 'kana/vim-textobj-user'           " vim text objects.
Plug 'LucHermitte/lh-vim-lib'          " vim library.
Plug 'b4winckler/vim-angry'            " Argument text-object.
Plug 'kana/vim-textobj-indent'         " Text objects for indented lines.
Plug 'nelstrom/vim-textobj-rubyblock'  " Ruby block definition.
Plug 'tmhedberg/matchit'               " Extend % operation.
Plug 'tpope/vim-repeat'                " Extend '.' operator.


" Tmux integration

"
Plug 'christoomey/vim-tmux-navigator'  " Easy pane navigation.
Plug 'edkolev/tmuxline.vim'            " Tmux status line generator.


" Navigation/Search.


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'                " FZF
Plug 'nelstrom/vim-visual-star-search' " Star for visual search.


" Colorschemes


Plug 'chriskempson/base16-vim', {'do': 'git checkout dict_fix'} " base16 with a local fix.
Plug 'vim-scripts/xterm-color-table.vim'                        " Handy utlity to print colors.


" Lints

Plug 'w0rp/ale'                         " Asynchronous Lint Engine.
