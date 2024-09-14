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
    lazy = false,
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

      require("which-key").add {
        { "<leader>f", group = "file" },
        { "<leader>g", group = "git" },
        { "<leader>r", group = "run" },
        { "<leader>l", group = "lsp" },
        { "<leader>t", group = "terminal" },
        { "<leader>c", group = "nvchad" },
        { "<leader>b", group = "buffer" },
        { "<leader>w", group = "window" },
        { "<leader>o", group = "obsidian" },
        { "<leader>ol", group = "obsidian link" },
        { "<leader>op", group = "obsidian paste" },
        { "<leader><tab>", group = "tab" },
      }
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

      conf.extensions.workspace = {
        -- keep insert mode after selection in the picker, default is false
        keep_insert = true,
        -- Highlight group used for the path in the picker, default is "String"
        path_hl = "String",
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
            -- local icons = { error = "", warn = "", info = "", hint = "" }
            local icons = { error = "", warn = "", info = "", hint = "󱧡" }
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
  {
    "natecraddock/workspaces.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    cmd = {
      "WorkspacesAdd",
      "WorkspacesAddDir",
      "WorkspacesRemove",
      "WorkspacesRemoveDir",
      "WorkspacesRename",
      "WorkspacesList",
      "WorkspacesListDirs",
      "WorkspacesOpen",
      "WorkspacesSyncDirs",
    },
    opts = {
      -- path to a file to store workspaces data in
      -- on a unix system this would be ~/.local/share/nvim/workspaces
      path = vim.fn.stdpath "data" .. "/workspaces",

      -- to change directory for nvim (:cd), or only for window (:lcd)
      -- deprecated, use cd_type instead
      -- global_cd = true,

      -- controls how the directory is changed. valid options are "global", "local", and "tab"
      --   "global" changes directory for the neovim process. same as the :cd command
      --   "local" changes directory for the current window. same as the :lcd command
      --   "tab" changes directory for the current tab. same as the :tcd command
      --
      -- if set, overrides the value of global_cd
      cd_type = "global",

      -- sort the list of workspaces by name after loading from the workspaces path.
      sort = true,

      -- sort by recent use rather than by name. requires sort to be true
      mru_sort = true,

      -- option to automatically activate workspace when opening neovim in a workspace directory
      auto_open = false,

      -- option to automatically activate workspace when changing directory not via this plugin
      auto_dir = false,

      -- enable info-level notifications after adding or removing a workspace
      notify_info = true,

      -- lists of hooks to run after specific actions
      -- hooks can be a lua function or a vim command (string)
      -- lua hooks take a name, a path, and an optional state table
      -- if only one hook is needed, the list may be omitted
      hooks = {
        add = {},
        remove = {},
        rename = {},
        open_pre = {},
        open = {},
      },
    },
    config = function(_, opts)
      require("workspaces").setup(opts)

      require("telescope").load_extension "workspaces"
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    cmd = {
      "ObsidianOpen",
      "ObsidianQuickSwitch",
      "ObsidianFollowLink",
      "ObsidianLinks",
      "ObsidianToday",
      "ObsidianTOC",
      "ObsidianPasteImg",
      "ObsidianSearch",
      "ObsidianToggleCheckbox",
    },
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      -- workspaces = {
      --   -- {
      --   --   name = "personal",
      --   --   path = "~/vaults/personal",
      --   -- },
      --   {
      --     name = "work",
      --     path = "D:\\Docs\\OneDrive\\知识归纳\\知识归纳",
      --   },
      -- },

      -- see below for full list of options 👇
      dir = "D:\\Docs\\OneDrive\\知识归纳\\知识归纳",

      -- picker = {
      --   -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
      --   name = "telescope.nvim",
      --   -- Optional, configure key mappings for the picker. These are the defaults.
      --   -- Not all pickers support all mappings.
      --   note_mappings = {
      --     -- Create a new note from your query.
      --     new = "<C-x>",
      --     -- Insert a link to the selected note.
      --     insert_link = "<C-l>",
      --   },
      --   tag_mappings = {
      --     -- Add tag(s) to current note.
      --     tag_note = "<C-x>",
      --     -- Insert a tag at the current location.
      --     insert_tag = "<C-l>",
      --   },
      -- },
      -- Optional, if you keep notes in a specific subdirectory of your vault.
      notes_subdir = "notes",

      -- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
      -- levels defined by "vim.log.levels.*".
      log_level = vim.log.levels.INFO,

      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "日记",
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = "%Y-%m-%d",
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = "%B %-d, %Y",
        -- Optional, default tags to add to each new daily note created.
        default_tags = { "笔记" },
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = nil,
      },

      -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
      completion = {
        -- Set to false to disable completion.
        nvim_cmp = true,
        -- Trigger completion at 2 chars.
        min_chars = 2,
      },

      -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
      -- way then set 'mappings = {}'.
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes.
        ["<leader>ch"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
        -- Smart action depending on context, either follow link or toggle checkbox.
        ["<cr>"] = {
          action = function()
            return require("obsidian").util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },

      -- Where to put new notes. Valid options are
      --  * "current_dir" - put new notes in same directory as the current buffer.
      --  * "notes_subdir" - put new notes in the default notes subdirectory.
      new_notes_location = "notes_subdir",

      -- Optional, customize how note IDs are generated given an optional title.
      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,

      -- Optional, customize how note file names are generated given the ID, target directory, and title.
      ---@param spec { id: string, dir: obsidian.Path, title: string|? }
      ---@return string|obsidian.Path The full path to the new note.
      note_path_func = function(spec)
        -- This is equivalent to the default behavior.
        local path = spec.dir / tostring(spec.id)
        return path:with_suffix ".md"
      end,

      -- Optional, customize how wiki links are formatted. You can set this to one of:
      --  * "use_alias_only", e.g. '[[Foo Bar]]'
      --  * "prepend_note_id", e.g. '[[foo-bar|Foo Bar]]'
      --  * "prepend_note_path", e.g. '[[foo-bar.md|Foo Bar]]'
      --  * "use_path_only", e.g. '[[foo-bar.md]]'
      -- Or you can set it to a function that takes a table of options and returns a string, like this:
      wiki_link_func = function(opts)
        return require("obsidian.util").wiki_link_id_prefix(opts)
      end,

      -- Optional, customize how markdown links are formatted.
      markdown_link_func = function(opts)
        return require("obsidian.util").markdown_link(opts)
      end,

      -- Either 'wiki' or 'markdown'.
      preferred_link_style = "wiki",

      -- Optional, boolean or a function that takes a filename and returns a boolean.
      -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
      disable_frontmatter = false,

      -- Optional, alternatively you can customize the frontmatter data.
      ---@return table
      note_frontmatter_func = function(note)
        -- Add the title of the note as an alias.
        if note.title then
          note:add_alias(note.title)
        end

        local out = { id = note.id, aliases = note.aliases, tags = note.tags }

        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,
      --
      -- -- Optional, for templates (see below).
      -- templates = {
      --   folder = "templates",
      --   date_format = "%Y-%m-%d",
      --   time_format = "%H:%M",
      --   -- A map for custom variables, the key should be the variable and the value a function
      --   substitutions = {},
      -- },
      --
      -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
      -- URL it will be ignored but you can customize this behavior here.
      ---@param url string
      follow_url_func = function(url)
        -- Open the URL in the default web browser.
        vim.fn.jobstart { "open", url } -- Mac OS
        -- vim.fn.jobstart({"xdg-open", url})  -- linux
        -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
        -- vim.ui.open(url) -- need Neovim 0.10.0+
      end,

      -- Optional, by default when you use `:ObsidianFollowLink` on a link to an image
      -- file it will be ignored but you can customize this behavior here.
      ---@param img string
      follow_img_func = function(img)
        vim.fn.jobstart { "qlmanage", "-p", img } -- Mac OS quick look preview
        -- vim.fn.jobstart({"xdg-open", url})  -- linux
        -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
      end,

      -- Optional, set to true if you use the Obsidian Advanced URI plugin.
      -- https://github.com/Vinzent03/obsidian-advanced-uri
      use_advanced_uri = false,

      -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
      open_app_foreground = false,

      picker = {
        -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
        name = "telescope.nvim",
        -- Optional, configure key mappings for the picker. These are the defaults.
        -- Not all pickers support all mappings.
        note_mappings = {
          -- Create a new note from your query.
          new = "<C-x>",
          -- Insert a link to the selected note.
          insert_link = "<C-l>",
        },
        tag_mappings = {
          -- Add tag(s) to current note.
          tag_note = "<C-x>",
          -- Insert a tag at the current location.
          insert_tag = "<C-l>",
        },
      },

      -- Optional, sort search results by "path", "modified", "accessed", or "created".
      -- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
      -- that `:ObsidianQuickSwitch` will show the notes sorted by latest modified time
      sort_by = "modified",
      sort_reversed = true,

      -- Set the maximum number of lines to read from notes on disk when performing certain searches.
      search_max_lines = 1000,

      -- Optional, determines how certain commands open notes. The valid options are:
      -- 1. "current" (the default) - to always open in the current window
      -- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
      -- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
      open_notes_in = "vsplit",
      --
      -- -- Optional, define your own callbacks to further customize behavior.
      -- callbacks = {
      --   -- Runs at the end of `require("obsidian").setup()`.
      --   ---@param client obsidian.Client
      --   post_setup = function(client) end,
      --
      --   -- Runs anytime you enter the buffer for a note.
      --   ---@param client obsidian.Client
      --   ---@param note obsidian.Note
      --   enter_note = function(client, note) end,
      --
      --   -- Runs anytime you leave the buffer for a note.
      --   ---@param client obsidian.Client
      --   ---@param note obsidian.Note
      --   leave_note = function(client, note) end,
      --
      --   -- Runs right before writing the buffer for a note.
      --   ---@param client obsidian.Client
      --   ---@param note obsidian.Note
      --   pre_write_note = function(client, note) end,
      --
      --   -- Runs anytime the workspace is set/changed.
      --   ---@param client obsidian.Client
      --   ---@param workspace obsidian.Workspace
      --   post_set_workspace = function(client, workspace) end,
      -- },
      --
      -- Optional, configure additional syntax highlighting / extmarks.
      -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
      ui = {
        enable = true, -- set to false to disable all additional syntax features
        update_debounce = 200, -- update delay after a text change (in milliseconds)
        max_file_length = 5000, -- disable UI features for files with more than this many lines
        -- Define how various check-boxes are displayed
        checkboxes = {
          -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
          [">"] = { char = "", hl_group = "ObsidianRightArrow" },
          ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
          ["!"] = { char = "", hl_group = "ObsidianImportant" },
          -- Replace the above with this if you don't have a patched font:
          -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
          -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

          -- You can also add more custom ones...
        },
        -- Use bullet marks for non-checkbox lists.
        bullets = { char = "•", hl_group = "ObsidianBullet" },
        external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        -- Replace the above with this if you don't have a patched font:
        -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        reference_text = { hl_group = "ObsidianRefText" },
        highlight_text = { hl_group = "ObsidianHighlightText" },
        tags = { hl_group = "ObsidianTag" },
        block_ids = { hl_group = "ObsidianBlockID" },
        hl_groups = {
          -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
          ObsidianTodo = { bold = true, fg = "#f78c6c" },
          ObsidianDone = { bold = true, fg = "#89ddff" },
          ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
          ObsidianTilde = { bold = true, fg = "#ff5370" },
          ObsidianImportant = { bold = true, fg = "#d73128" },
          ObsidianBullet = { bold = true, fg = "#89ddff" },
          ObsidianRefText = { underline = true, fg = "#c792ea" },
          ObsidianExtLinkIcon = { fg = "#c792ea" },
          ObsidianTag = { italic = true, fg = "#89ddff" },
          ObsidianBlockID = { italic = true, fg = "#89ddff" },
          ObsidianHighlightText = { bg = "#75662e" },
        },
      },

      -- Specify how to handle attachments.
      attachments = {
        -- The default folder to place images in via `:ObsidianPasteImg`.
        -- If this is a relative path it will be interpreted as relative to the vault root.
        -- You can always override this per image by passing a full path to the command instead of just a filename.
        img_folder = "素材/imgs", -- This is the default

        -- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
        ---@return string
        img_name_func = function()
          -- Prefix image names with timestamp.
          return string.format("%s-", os.time())
        end,

        -- A function that determines the text to insert in the note when pasting an image.
        -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
        -- This is the default implementation.
        ---@param client obsidian.Client
        ---@param path obsidian.Path the absolute path to the image file
        ---@return string
        img_text_func = function(client, path)
          path = client:vault_relative_path(path) or path
          return string.format("![%s](%s)", path.name, path)
        end,
      },
    },
  },
  -- install without yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
