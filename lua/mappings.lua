require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

-- del keymap
nomap("n", "<C-h>")
nomap("n", "<C-l>")
nomap("n", "<C-j>")
nomap("n", "<C-k>")
nomap("n", "<leader>cc")

nomap("n", "<leader>wk")
nomap("n", "<leader>wK")

nomap("n", "<leader>/")
nomap("n", "<leader>b")
nomap("n", "<leader>h")
nomap("n", "<leader>n")
nomap("n", "<leader>v")
nomap("n", "<leader>x")
nomap("n", "<leader>cm")
nomap("n", "<tab>")
nomap("n", "<S-tab>")
nomap("n", "<leader>ds")
nomap("n", "<leader>ma")
nomap("n", "<leader>pt")
nomap("n", "<leader>th")

-- set keymap
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- window management
map("n", "<leader>wl", "<C-w>l", { desc = "move right" })
map("n", "<leader>wh", "<C-w>h", { desc = "move left" })
map("n", "<leader>wj", "<C-w>j", { desc = "move bottom" })
map("n", "<leader>wk", "<C-w>k", { desc = "move top" })
map("n", "<leader>ws", "<C-w>s", { desc = "split" })
map("n", "<leader>wv", "<C-w>v", { desc = "vsplit" })
map("n", "<leader>wc", "<C-w>c", { desc = "close window" })
map("n", "<leader>wm", "<CMD>TZFocus<CR>", { desc = "max window" })
map("n", "<leader>w=", "<C-w>=", { desc = "window average" })

-- buffer management
map("n", "<leader>bb", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<leader>bn", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<leader>bp", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>bc", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

map("n", "<leader>bo", function()
  require("nvchad.tabufline").closeAllBufs(false)
end, { desc = "buff close other" })

-- telescope
map("n", "<leader>fk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })
map("n", "<leader>fK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })
map("n", "<leader>fT", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fc", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })
map("n", "<leader>fH", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })

-- git
map("n", "<leader>gm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
-- map("n", "<leader>gg", function()
--   require("nvchad.term").toggle { pos = "float", id = "floa", cmd = "lazygit", size = 0.8, float_opts = {
--     row=0.1,
--     col=0.1,
--     width=0.8,
--     height=0.8,
--     -- border = "none"
--   } }
-- end, { desc = "lazygit" })

-- tab management
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "tab new" })
map("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "tab goto next" })
map("n", "<leader><tab>p", "<cmd>tabprev<cr>", { desc = "tab goto prev" })
map("n", "<leader><tab>c", "<cmd>tabclose<cr>", { desc = "tab close" })

-- Obsidian
map("n", "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", { desc = "quick query" })
map("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "search" })

-- markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    map("n", "<leader>lpt", "<cmd>MarkdownPreviewToggle<cr>", { desc = "preview toggle", buffer = true })
    map("n", "<leader>lpp", "<cmd>MarkdownPreview<cr>", { desc = "preview", buffer = true })
    map("n", "<leader>lps", "<cmd>MarkdownPreviewStop<cr>", { desc = "preview stop", buffer = true })

    -- Obsidian
    map("n", "<leader>olv", "<cmd>ObsidianFollowLink vsplit<cr>", { desc = "follow link vsplit", buffer = true })
    map("n", "<leader>ols", "<cmd>ObsidianFollowLink hsplit<cr>", { desc = "follow link hsplit", buffer = true })
    map("n", "<leader>ola", "<cmd>ObsidianLinks<cr>", { desc = "links on current buffer", buffer = true })
    map("n", "<leader>ot", "<cmd>ObsidianToday<cr>", { desc = "open/create daily note", buffer = true })
    map("n", "<leader>oT", "<cmd>ObsidianTOC<cr>", { desc = "TOC", buffer = true })
    map("n", "<leader>opi", "<cmd>ObsidianPasteImg<cr>", { desc = "paste image", buffer = true })
    map(
      "n",
      "<leader>oc",
      "<cmd>ObsidianToggleCheckbox<cr>",
      { desc = "cycle through checkbox options", buffer = true }
    )
  end,
})
-- terimal management
