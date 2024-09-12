return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {
      keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "<c-s>",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
        change_line = "cS",
      },
    },
    config = function(_, opts)
      require("nvim-surround").setup(opts)
    end,
  },
  {
    "echasnovski/mini.move",
    version = "*",
    event = "BufReadPre",
    opts = {
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = "<C-h>",
        right = "<C-l>",
        down = "<c-j>",
        up = "<c-k>",

        -- Move current line in Normal mode
        line_left = "<C-h>",
        line_right = "<c-l>",
        line_down = "<c-j>",
        line_up = "<c-k>",
      },

      -- Options which control moving behavior
      options = {
        -- Automatically reindent selection during linewise vertical move
        reindent_linewise = true,
      },
    },
  },
  {
    "folke/flash.nvim",
    -- event = "VeryLazy",
    -- version = "1.18.3",
    lazy = false,
    opts = {
      label = {
        rainbow = {
          enabled = false,
          -- number between 1 and 9
          shade = 5,
        },
      },
      -- highlight = {
      --   groups = {
      --     match = "Search",
      --     current = "LspSignatureActiveParameter",
      --     backdrop = "FlashBackdrop",
      --     label = "PmenuSel",
      --   },
      -- },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "tsx",
        "lua",
        "typescript",
        "javascript",
        "html",
        "css",
        "scss",
        "json",
        "markdown",
        "markdown_inline",
        "vue",
        "c_sharp",
        "python",
      },
    },
  },
}
