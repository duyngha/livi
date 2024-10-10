print('Hello, Leo. Welcome back!')

-- Ensure packer.nvim is installed
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Add nvim-lspconfig
  use 'neovim/nvim-lspconfig'

  -- COC
  use {'neoclide/coc.nvim', branch = 'release'}

  -- Add telescope.nvim
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Git
  use 'dinhhuy258/git.nvim'

  -- For status bar at bottom
  use {
    "nvim-lualine/lualine.nvim",
    require = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Add nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  -- Toggle Term
  use {"akinsho/toggleterm.nvim", tag = '*'}

  -- Add the kanagawa.nvim theme
  use 'rebelot/kanagawa.nvim'
end)

-----------------------------------------------------------------------------------------------------------------
-------------------------------------- PLUGINS CONFIGURATION ----------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-- Require the nvim-lspconfig plugin
local nvim_lsp = require('lspconfig')

-- Configure the Go language server
nvim_lsp.gopls.setup{
  cmd = {"gopls"},
  filetypes = {"go", "gomod"},
  root_dir = nvim_lsp.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

-------------------------------------- COC CONFIG ----------------------------------------------------
vim.cmd([[
  " Use coc.nvim for LSP
  let g:coc_global_extensions = ['coc-json', 'coc-go']

  " Keybindings for coc.nvim
  inoremap <silent><expr> <C-Space> coc#refresh()
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
]])

-------------------------------------- TELESCOPLE CONFIG ----------------------------------------------------
-- Load and configure telescope
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

require('git').setup({})

require('lualine').setup({
  theme = 'kanagawa'
})

-------------------------------------- FILE EXPLORER CONFIG ----------------------------------------------------
require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-------------------------------------- TOGGLETERM CONFIG ----------------------------------------------------
require("toggleterm").setup({
  direction = 'float',
  open_mapping = [[<C-m>]],  -- Automatically bind <C-m> for opening
  start_in_insert = true
})

-------------------------------------- THEME CONFIG ----------------------------------------------------
-- Load and configure the kanagawa theme
require('kanagawa').setup({
  commentStyle = { italic = false },
  keywordStyle = { bold = true },
  -- Additional configuration options
})

-- Apply the theme
vim.cmd('colorscheme kanagawa')

-------------------------------------- BUILT-IN CONFIG ----------------------------------------------------
require('settings')
require('keymaps')