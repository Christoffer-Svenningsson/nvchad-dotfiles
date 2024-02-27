local M = {}

M.dap = {
  plugin = true,
  n = {

    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },

    -- Thus far i only care about this in rust, how to code this??
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    },

    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue debugger"
    }

  }
}

--Add lsp mapping
M.lspconfig = {
  n = {
    ["<leader>lr"] = {
      function()
        vim.lsp.buf.rename()
      end,
      "LSP refactor name",
    }
  }
}

M.copilot = {
  i = {
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
      end,
      "Copilot Accept",
      {replace_keycodes = true, nowait=true, silent=true, expr=true, noremap=true}
    },
  }
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function()
        require('crates').upgrade_all_crates()
      end,
      "Update crates"
    }
  }
}

return M
