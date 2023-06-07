-- case-agnostic searches
vim.opt.ignorecase = true

-- don't change dir when searching
vim.opt.autochdir = false

-- number of lines at the beginning and end of files checked for file-specific vars
vim.opt.modelines = 0

-- reload files changed outside of Vim not currently modified in Vim (needs below)
vim.opt.autoread = true

-- http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
-- au FocusGained,BufEnter * :silent! !

-- use Unicode
vim.opt.encoding = 'utf-8'

-- errors flash screen rather than emit beep
vim.opt.visualbell = true

-- make Backspace work like Delete
-- vim.opt.backspace = 'indent,eol,start'

-- don't create `filename~` backups
vim.opt.backup = false

-- don't create temp files
vim.opt.swapfile = false

-- line numbers and distances
vim.opt.relativenumber = true
vim.opt.number = true

-- number of lines offset when jumping
vim.opt.scrolloff = 2

-- Tab key enters 2 spaces
-- To enter a TAB character when `expandtab` is in effect,
-- CTRL-v-TAB
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Indent new line the same as the preceding line
vim.opt.autoindent = true

-- statusline indicates insert or normal mode
-- vim.opt.showmode = 'showcmd'

-- http://vim.wikia.com/wiki/Searchin
-- set hlsearch incsearch ignorecase smartcase

-- highlight matching parens, braces, brackets, etc
vim.opt.showmatch = true

vim.opt.wrap = true

-- make scrolling and painting fast
-- ttyfast kept for vim compatibility but not needed for nvim
-- vim.opt.ttyfast = 'lazyredraw'
vim.opt.ttyfast = true

-- http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
vim.opt.autochdir = true

-- open new buffers without saving current modifications (buffer remains open)
vim.opt.hidden = true

-- http://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
-- set wildmenu wildmode=list:longest,full

-- StatusLine always visible, display full path
-- http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
-- set laststatus=2 statusline=%F
vim.opt.laststatus = 2
-- vim.opt.statusline = %F

-- Use system clipboard
-- http://vim.wikia.com/wiki/Accessing_the_system_clipboard
-- for linux
-- set clipboard=unnamedplus
vim.opt.clipboard = 'unnamedplus'
-- for macOS
-- set clipboard=unnamed

-- Folding
-- https://vim.fandom.com/wiki/Folding
-- https://vim.fandom.com/wiki/All_folds_open_when_opening_a_file
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldmethod = 'indent'
vim.opt.foldnestmax = 1
vim.opt.foldlevelstart = 1

-- netrw and vim-vinegar
-- let g:netrw_browse_split = 3
vim.g.netrw_browse_split = 3

vim.opt.whichwrap = 'lh'
-- :set whichwrap=lh

---------------------------------------------------------------

vim.g.mapleader = ','

vim.api.nvim_set_keymap(
  "i",
  "jk",
  "<Esc>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<C-j>",
  "20<C-e>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<C-k>",
  "20<C-y>",
  { noremap = true }
)



---------------------------------------------------------------

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/plugged')

-- https://github.com/nvim-treesitter/nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter'

-- https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

-- https://github.com/tomasiser/vim-code-dark
Plug 'tomasiser/vim-code-dark'

-- https://github.com/Mofiqul/vscode.nvim
Plug 'Mofiqul/vscode.nvim'

-- https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

-- https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

-- https://github.com/tpope/vim-vinegar
Plug 'tpope/vim-vinegar'

-- https://github.com/APZelos/blamer.nvim
Plug 'APZelos/blamer.nvim'

-- https://github.com/nvim-telescope/telescope.nvim
Plug 'nvim-telescope/telescope.nvim'
-- local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', {})
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', {})
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', {})
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', {})
vim.keymap.set('n', '<leader>gg', ':Telescope grep_string<CR>', {})

-- https://github.com/nvim-lua/plenary.nvim
Plug 'nvim-lua/plenary.nvim'

-- https://github.com/simrat39/symbols-outline.nvim
-- Plug 'simrat39/symbols-outline.nvim'

-- https://github.com/neovim/nvim-lspconfig
Plug 'neovim/nvim-lspconfig'

-- https://github.com/prabirshrestha/vim-lsp
-- Plug 'prabirshrestha/vim-lsp'

-- https://github.com/MaskRay/ccls
Plug 'MaskRay/ccls'

-- https://github.com/jeaye/color_coded
-- Plug 'jeaye/color_coded'

-- https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
vim.g.airline_powerline_fonts = 1

Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
Plug('preservim/nerdtree', {on = 'NERDTreeToggle'})
Plug 'rhysd/vim-clang-format'
Plug 'tomasiser/vim-code-dark'

-- Plug 'preservim/nerdtree'
vim.api.nvim_set_keymap(
  "n",
  "<C-n>",
  ":NERDTreeToggle<CR>",
  { noremap = true }
)
vim.call('plug#end')

---------------------------------------------------------------

vim.opt.syntax = 'enable'

vim.opt.termguicolors = true

-- Dark scheme
-- vim.opt.colorscheme = 'codedark'
-- vim.opt.background = 'dark'

-- Show character column
vim.opt.colorcolumn = '80'

---------------------------------------------------------------

-- Lua:
-- For dark theme (neovim's default)
vim.o.background = 'dark'
-- For light theme
vim.o.background = 'light'

local c = require('vscode.colors').get_colors()
require('vscode').setup({
    -- Alternatively set style in setup
    -- style = 'light'

    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = '#FFFFFF',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})
require('vscode').load('dark')

---------------------------------------------------------------

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

---------------------------------------------------------------

-- vim.api.nvim_set_keymap(
  -- "n",
  -- "<F4>",
  -- "",
  -- {}
-- )
-- vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', {})

---------------------------------------------------------------

-- require'lspconfig'.clangd.setup{}

---------------------------------------------------------------
