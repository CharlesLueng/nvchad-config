-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {
  ui = {
    transparenc = true,
    tabufline = {
      -- order = { "treeOffset", "tabs" },
    },
    statusline = {
      theme = "minimal", -- default/vscode/vscode_colored/minimal
      -- default/round/block/arrow separators work only for default statusline theme
      -- round and block will work for minimal theme only
      separator_style = "round",
      order = nil,
      modules = nil,
    },
    cmp = {
      style = "atom",
    },
    -- telescope = { style = "bordered" }, -- borderless / bordered
    telescope = { style = "borderless" }, -- borderless / bordered
  },
  base46 = {
    theme = "onedarkCus",
    transparenc = true,
    hl_override = {
      LineNr = {fg = "light_grey"},
      Comment = { italic = true, fg = "light_grey" },
      ["@comment"] = { italic = true, fg = "light_grey" },
    },
  },
}

M.lsp = {
  signature = true,
}

-- M.base46 = {
--   theme = "onedarkCus",
--   transparenc = true
--   -- hl_override = {
--   -- 	Comment = { italic = true },
--   -- 	["@comment"] = { italic = true },
--   -- },
-- }

M.term = {
  hl = "Normal:term,WinSeparator:WinSeparator",
  sizes = { sp = 0.4, vsp = 0.4 },
  float = {
    relative = "editor",
    row = 0.1,
    col = 0.1,
    width = 0.8,
    height = 0.8,
    border = "single",
  },
}

return M
