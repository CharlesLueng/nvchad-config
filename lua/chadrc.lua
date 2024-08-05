-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",

  cmp = {
    style = "atom",
  },

  tabufline = {
    order = { "treeOffset", "tabs" },
  },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

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
