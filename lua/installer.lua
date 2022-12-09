local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
      return true
    end
    return false
  end
  vim.cmd([[packadd packer.nvim]])
  
  local packer_bootstrap = ensure_packer() -- true if packer was just installed
  
  -- autocommand that reloads neovim and installs/updates/removes plugins
  -- when file is saved
  vim.cmd([[ 
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost installer.lua source <afile> | PackerSync
    augroup end
  ]])
  
  -- import packer safely
  local status, packer = pcall(require, "packer")
  if not status then
    return
  end
  
  packer.init({
    display = {
      working_sym = "ﲊ",
      error_sym = "✗ ",
      done_sym = " ",
      removed_sym = " ",
      moved_sym = "",
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end,
      prompt_border = 'rounded',
    },
    git = {
      clone_timeout = 800, -- Timeout, in seconds, for git clones
    },
    compile_on_sync = true,
    auto_clean = true,
  })
  
  -- add list of plugins to install
  return packer.startup(function(use)
    -- packer can manage itself
    use {
      "wbthomason/packer.nvim",
       cmd = {"PackerCompile", "PackerStatus", "PackerInstall", "PackerUpdate", "PackerLoad", "PackerClean"},
        config = function()
        require("installer")
      end
    }
  
    use {
      "nvim-lua/plenary.nvim",
      module = "plenary"
    }
  
    use {
      "catppuccin/nvim",
      config = function()
        require("config.catppuccin")
      end
  }
  
    use {
      "dstein64/vim-startuptime",
      cmd = "StartupTime"
    }
  
  
    use {
      "nvim-tree/nvim-tree.lua",
      cmd = {"NvimTreeToggle", "NvimTreeFocus"},
      config = function()
        require("config.nvim-tree")
      end
    }
  
    use {
      "christoomey/vim-tmux-navigator",
      event = "BufRead"
    }
  
    use {
      "nvim-tree/nvim-web-devicons",
      module = "nvim-web-devicons",
    }
  
    use {
      "norcalli/nvim-colorizer.lua",
      event = "BufRead",
      config = function()
        require("config.colorize")
      end
  
    }
  
    use {
      "glepnir/dashboard-nvim",
      config = function()
        require("config.dashboard")
      end
    }
  
    use {
      "nvim-lualine/lualine.nvim",
      event = "BufRead",
      config = function()
        require("config.lualine")
      end
    }
  
    use {
      'numToStr/Comment.nvim',
      event = "BufRead",
      config = function()
          require('config.comment')
      end
    }
  
    use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      config = function()
        require("config.telescope")
      end
  
    }
  
    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "bufreadpre",
      config = function()
        require("config.blankline")
      end
  
    }
  
    use {
      "nvim-treesitter/nvim-treesitter",
      module = "nvim-treesitter",
      cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo"},
      run = ":TSUpdate",
      config = function()
        require "config.treesitter"
      end,
    }
  
    use {
      "neovim/nvim-lspconfig",
      event = "BufRead",
      config = function()
        require("config.lsp.lspconfig")
      end
  
    }
  
    use {
      "glepnir/lspsaga.nvim",
      after = "nvim-lspconfig",
      config = function()
        require("config.lsp.lspsaga")
      end,
    }
  
    use {
      "williamboman/mason.nvim",
      config = function()
        require("config.lsp.mason")
      end
    }
  
    use {
      "williamboman/mason-lspconfig.nvim",
    }
  
    use {
      "hrsh7th/nvim-cmp",
      module = "cmp",
      event = "InsertEnter",
      config = function()
        require "config.cmp"
      end
    }
  
    use {
      "onsails/lspkind.nvim",
      event = "BufRead"
    }
  
  
    use {
      "rafamadriz/friendly-snippets",
      module = "friendlysnippet",
    }
  
    use {
      "L3MON4D3/LuaSnip",
      module = "luasnip",
    }
  
    use {
      "saadparwaiz1/cmp_luasnip",
      after = "LuaSnip",
    }
  
    use {
      "hrsh7th/cmp-nvim-lua",
      after = "cmp_luasnip",
    }
  
    use {
      "hrsh7th/cmp-nvim-lsp",
      after = "cmp-nvim-lua"
    }
  
    use {
      "hrsh7th/cmp-buffer",
      after = "cmp-nvim-lsp",
    }
  
    use {
      "hrsh7th/cmp-path",
      after = "cmp-buffer",
    }
  
    use {
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = function()
        require("config.autopairs")
      end,
    }
  
  
  
  
  
  
  
  
  
  
  
    if packer_bootstrap then
      require("packer").sync()
    end
  end)
  
