require "nvchad.options"

-- add yours here!

local o = vim.o
o.relativenumber = true
o.scrolloff = 5
o.sidescrolloff = 5

vim.opt.clipboard:append "unnamedplus"

-- o.clipboard:append "unnamedplus"

-- o.cursorlineopt ='both' -- to enable cursorline!

-- 取消自动注释
-- vim.cmd("autocmd BufEnter * set formatoptions-=cro")
-- vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
