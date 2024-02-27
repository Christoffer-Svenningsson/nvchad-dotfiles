local cmp = require "cmp"

local plugins = {

  {
    "github/copilot.vim",
    lazy = false,
    config = function()  -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true;
      vim.g.copilot_assume_mapped = true;
      --vim.g.copilot_tab_fallback = string.rep(" ", vim.opt.tabstop._value)
    -- The mapping is set to other key, see custom/lua/mappings
    -- or run <leader>ch to see copilot mapping section
    end
  },

  {
    'echasnovski/mini.splitjoin',
    version = '*',
    lazy=false,
    config = function()
      require('mini.splitjoin').setup() 
    end
  },

  --{
  --  "zbirenbaum/copilot.lua",
  --  enabled = true,
  --  cmd = "Copilot",
  --  event = "InsertEnter",
  --  opts = {
  --    suggestion = { enabled = false },
  --    panel = { enabled = false },
  --  },
  --},

  {
    "niuiic/core.nvim"
  },

  {
    "niuiic/remote.nvim",
    config = {
      config_file = "~/.nvim/remote.json"
    }
  },

  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.main"
    end
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "haskell-language-server",
        "pyright",
        "bash-language-server",
        "clangd",
        "rust-analyzer",
        "clang-format",
        "codelldb",
        "cmake-language-server",

      }
    }
  },

  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },


  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui =  require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function() 
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_initialized["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap"
    },
    opts = {
      handlers = {}
    }
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end
  },

  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
      crates.show()
      require("core.utils").load_mappings("crates")
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    --dependencies = {
    --  "hrsh7th/cmp-emoji",
    --  {
    --    "zbirenbaum/copilot-cmp",
    --    opts = {},
    --  },
    --},
    opts = function(_, opts)
      local M = require "plugins.configs.cmp" 
      --opts.sources = M.config.sources(vim.list_extend(opts.sources, { { name = "copilot" }, { name = "emoji" } }))
      M.completion.completeopt = "menu,menuone,noselect"
      M.mapping["<CR>"] = cmp.mapping.confirm {
       behavior = cmp.ConfirmBehavior.Insert,
       select = false,
      }
      table.insert(M.sources, {name = "crates"})
      return M
    end,
  }
}

return plugins
