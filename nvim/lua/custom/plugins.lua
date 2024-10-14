local overrides = require "custom.configs.overrides"

local plugins = {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  {
    "Wansmer/treesj",
    keys = {
      {
        "<leader>m",
        "<CMD>TSJToggle<CR>",
        desc = "Toggle Treesitter Join",
      },
    },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = { use_default_keymaps = false },
  },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
  },
  {
    "folke/todo-comments.nvim",
    opts = {},
    event = "VeryLazy",
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      hover = {
        enabled = false,  -- Disable hover handler in Noice
      },
      signature = {
        enabled = false,  -- Disable signatureHelp handler in Noice
      },
      progress = {
        enabled = true,  -- Enable LSP progress messages
        throttle = 1000, -- Update every 1 second
      },
    },
    notify = {
      enabled = true,  -- Enable notifications
      timeout = 3000,  -- Auto-dismiss after 3 seconds
    },
    messages = {
      enabled = true,
      view = "notify", -- Use 'notify' view for messages
      filter = {
        "search hit BOTTOM, continuing at TOP",  -- Filter unwanted messages
      },
    },
    history = {
      enabled = true,
      view = "split", -- Show history in a split window
    },
    popupmenu = {
      enabled = true,
      backend = "nui",  -- Use NUI for popups
      opts = {
        border = "single", -- Single-line border
        win_options = {
          winblend = 10,   -- Add transparency
        },
      },
    },
    views = {
      mini = {
        backend = "popup",
        align = "center",
        border = "rounded",
        timeout = 2000,  -- Auto-dismiss mini popups after 2 seconds
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}

  -- lazy.nvim
--   {
--     "rachartier/tiny-inline-diagnostic.nvim",
--     event = "VeryLazy", -- Or `LspAttach`
--     config = function()
--         require('tiny-inline-diagnostic').setup()
--     end
-- },
}

return plugins
