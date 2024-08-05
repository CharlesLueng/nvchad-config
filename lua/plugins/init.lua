return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "Pocco81/TrueZen.nvim",
    cmd = { "TZAtaraxis", "TZMinimalist", "TZFocus" },
    config = function()
      require "configs.truezen" -- just an example path
    end,
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
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "csharpier",
        "omnisharp",
        -- { "omnisharp", version = "v1.39.8" },
        -- 'eslint_d',
        "prettierd",
        "vetur-vls",
        "vue-language-server",
        "pyright",
        "isort",
        "black",
        "typescript-language-server",
        "css-lsp",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local defaultOpts = require "nvchad.configs.cmp"

      defaultOpts.mapping["<C-y>"] = defaultOpts.mapping["<CR>"]
      -- defaultOpts.mapping["<C-y>"] = defaultOpts.mapping["<CR>"]
      -- defaultOpts.mapping["<C-y>"] = defaultOpts.mapping["<CR>"]

      return defaultOpts
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neoconf.nvim",
      "Hoffs/omnisharp-extended-lsp.nvim",
    },
    config = function()
      require("neoconf").setup {
        -- override any of the default settings here
      }

      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = {
      definition = {
        width = 0.8,
        height = 0.7,
      },
      diagnostic = {
        border_follow = false,
        keys = {
          quit = { "q", "<ESC>", "<C-c>" },
          quit_in_show = { "q", "<ESC>", "<C-c>" },
        },
      },
      code_action = {
        keys = {
          quit = { "q", "<ESC>", "<C-c>" },
        },
      },
      ui = {
        -- 关闭烦人的CodeAction的小灯泡，哪哪都是小灯泡
        -- 取而代之则使用自定义高亮行, SignColumn 和 高亮行
        -- code_action = " ",
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },
  {
    "folke/which-key.nvim",
    config = function(_, opts)
      -- default config function's stuff
      dofile(vim.g.base46_cache .. "whichkey")
      require("which-key").setup(opts)

      -- your custom stuff
      -- require("which-key").register({
      --   f = { name = "file" },
      --   g = { name = "git" },
      --   r = { name = "run" },
      --   l = { name = "lsp" },
      --   t = { name = "terminal" },
      --   b = { name = "buffer" },
      --   w = { name = "window" },
      --   ["<tab>"] = { name = "tab" },
      -- }, { prefix = "<leader>" })

      require("which-key").add({
        {"<leader>f", group = "file" },
        {"<leader>g", group = "git"},
        {"<leader>r" , group = "run" },
        {"<leader>l",  group = "lsp" },
        {"<leader>t", group = "terminal" },
        {"<leader>b", group = "buffer" },
        {"<leader>w", group = "window" },
        {"<leader><tab>", group = "tab" },
      })
    end,
  },
  -- git stuff
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require "configs.gitsigns"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "git")
      require("gitsigns").setup(opts)
    end,
  },
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
      highlight = {
        groups = {
          match = "Search",
          current = "LspSignatureActiveParameter",
          backdrop = "FlashBackdrop",
          label = "PmenuSel",
        },
      },
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
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"
      local actions = require "telescope.actions"
      local action_layout = require "telescope.actions.layout"

      conf.defaults.mappings.i = {
        ["<Esc>"] = require("telescope.actions").close,
        ["<A-p>"] = require("telescope.actions.layout").toggle_preview,
        ["<C-s>"] = require("telescope.actions").select_horizontal,
      }

      conf.defaults.mappings.n = {
        ["<A-p>"] = require("telescope.actions.layout").toggle_preview,
        ["<C-s>"] = require("telescope.actions").select_horizontal,
      }

      conf.defaults.file_ignore_patterns = {
        "codegen.ts",
        ".git",
        "lazy-lock.json",
        "*-lock.yaml",
        "node_modules",
        "%.lock",
        "build",
        "release",
        "bin",
        "obj",
        "*_modules",
        "dist-electron",
        "dist",
        ".vscode",
        "App_Data",
      }

      conf.pickers = {}
      conf.pickers.buffers = {}

      conf.pickers.buffers.mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer + actions.move_to_bottom,
        },
      }

      -- or
      -- table.insert(conf.defaults.mappings.i, your table)

      return conf
    end,
  },
  {
    "folke/todo-comments.nvim",
    keys = {
      { "]t", "<cmd>lua require('todo-comments').jump_next()<cr>", { desc = "Next todo comment" } },
      { "[t", "<cmd>lua require('todo-comments').jump_prev()<cr>", { desc = "Previous todo comment" } },
      { "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Previous todo comment" } },
    },
    event = { "BufReadPre" },
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      -- vim.keymap.set("n", "]t", function()
      -- 	require("todo-comments").jump_next()
      -- end, { desc = "Next todo comment" })
      --
      -- vim.keymap.set("n", "[t", function()
      -- 	require("todo-comments").jump_prev()
      -- end, { desc = "Previous todo comment" })

      -- vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Previous todo comment" })

      require("todo-comments").setup()
    end,
  },
  {
    "b0o/incline.nvim",
    event = { "BufReadPre" },
    config = function()
      -- require("incline").setup {
      --   window = {
      --     margin = { vertical = 0, horizontal = 0 },
      --     -- You can probably omit this because it should not be necessary
      --     options = { signcolumn = "no", wrap = false },
      --     padding = 0,
      --   },
      --   -- Omit this if you've already set these highlight groups somewhere else in your config
      --   highlight = {
      --     -- groups = {
      --     --   InclineOuter = { guifg = "red" },
      --     --   InclineCenter = { guibg = "red", guifg = "white" },
      --     --   InclineOuterInactive = { guifg = "gray" },
      --     --   InclineCenterInactive = { guibg = "gray", guifg = "white" },
      --     -- },
      --   },
      --   hide = {
      --     -- You can omit this because false is the default value
      --     cursorline = false,
      --   },
      --   render = function(props)
      --     local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
      --     if vim.bo[props.buf].modified then
      --       filename = filename .. "  "
      --     end
      --     local suffix = props.focused and "" or "Inactive"
      --     local outerGroup = "InclineOuter" .. suffix
      --     local centerGroup = "InclineCenter" .. suffix
      --     local icon, iconColor = require("nvim-web-devicons").get_icon_color(filename)
      --     -- The result table can contain nested tables.
      --     -- This works similar to how nested HTML tags work, and makes it easier to apply
      --     -- styles to overlapping parts of the statusline without repeating yourself.
      --     -- Styles defined in nested tables will override styles defined in their parent
      --     -- tables.
      --     return {
      --       "",
      --       {
      --         { icon  },
      --         " ",
      --         filename,
      --       },
      --       "",
      --     }
      --   end,
      -- }

      local devicons = require "nvim-web-devicons"
      require("incline").setup {
        render = function(props)
          -- local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          -- local modified = vim.bo[props.buf].modified
          -- return {
          --   " ",
          --   filename,
          --   modified and { " *", guifg = "#888888", gui = "bold" } or "",
          --   " ",
          --   guibg = "#111111",
          --   guifg = "#eeeeee",
          -- }

          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)

          local function get_git_diff()
            local icons = { removed = "", changed = "", added = "" }
            local signs = vim.b[props.buf].gitsigns_status_dict
            local labels = {}
            if signs == nil then
              return labels
            end
            for name, icon in pairs(icons) do
              if tonumber(signs[name]) and signs[name] > 0 then
                table.insert(labels, { icon .. " " .. signs[name] .. " ", group = "Diff" .. name })
              end
            end
            if #labels > 0 then
              table.insert(labels, { "┊ " })
            end
            return labels
          end

          local function get_diagnostic_label()
            local icons = { error = "", warn = "", info = "", hint = "" }
            local label = {}

            for severity, icon in pairs(icons) do
              local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
              if n > 0 then
                table.insert(label, { icon .. " " .. n .. " ", group = "DiagnosticSign" .. severity })
              end
            end
            if #label > 0 then
              table.insert(label, { "┊ " })
            end
            return label
          end

          return {
            { get_diagnostic_label() },
            { get_git_diff() },
            { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
            { filename .. " ", gui = vim.bo[props.buf].modified and "bold,italic" or "bold" },
            { "┊  " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" },
          }
        end,
      }
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "danymat/neogen",
    event = { "BufReadPre" },
    config = function()
      require("neogen").setup {
        input_after_comment = true,
        languages = {
          cs = {
            template = {
              annotation_convention = "xmldoc",
            },
          },
          python = {
            template = {
              annotation_convention = "google_docstrings",
            },
          },
          vue = {
            template = {
              annotation_convention = "jsdoc",
            },
          },
          typescript = {
            template = {
              annotation_convention = "tsdoc",
            },
          },
          typescriptreact = {
            template = {
              annotation_convention = "tsdoc",
            },
          },
          javascript = {
            template = {
              annotation_convention = "jsdoc",
            },
          },
          javascriptreact = {
            template = {
              annotation_convention = "jsdoc",
            },
          },
          lua = {
            template = {
              annotation_convention = "emmylua",
            },
          },
        },
      }

      local map = vim.keymap

      map.set("n", "<Leader>lc", "<cmd>Neogen<cr>", { desc = "Generate Doc Comment" })
    end,
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    opts = {
      ---Add a space b/w comment and the line
      padding = true,
      ---Whether the cursor should stay at its position
      sticky = true,
      ---Lines to be ignored while (un)comment
      ignore = nil,
      ---LHS of toggle mappings in NORMAL mode
      toggler = {
        ---Line-comment toggle keymap
        line = "gcc",
        ---Block-comment toggle keymap
        block = "gbc",
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        ---Line-comment keymap
        line = "gc",
        ---Block-comment keymap
        block = "gb",
      },
      ---LHS of extra mappings
      extra = {
        ---Add comment on the line above
        above = "gcO",
        ---Add comment on the line below
        below = "gco",
        ---Add comment at the end of line
        eol = "gcA",
      },
      ---Enable keybindings
      ---NOTE: If given `false` then the plugin won't create any mappings
      mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
      },
      ---Function to call before (un)comment
      pre_hook = nil,
      ---Function to call after (un)comment
      post_hook = nil,
    },
  },
  {
    "MattesGroeger/vim-bookmarks",
    keys = { "<leader>mc", "mm", "mi", "mn", "mp", "ma", "mc", "mx" },
    event = { "BufReadPre" },
    -- dependencies = {
    -- "tom-anders/telescope-vim-bookmarks.nvim",
    -- "nvim-telescope/telescope.nvim",
    -- },
    config = function()
      vim.g.bookmark_sign = "♥"
      vim.g.bookmark_highlight_lines = 1

      -- require("telescope").load_extension "vim_bookmarks"
    end,
  },
}
