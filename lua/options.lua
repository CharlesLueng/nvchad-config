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

if vim.loop.os_uname().sysname == "Windows_NT" then
  -- 命令行重置为powershell
  local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }

  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
end
