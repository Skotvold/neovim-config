require "nvchad.options"

-- add yours here!
vim.opt.relativenumber = true

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

if vim.fn.has("win32") == 1 or vim.fn.has("win32unix") == 1 then
-- setup neovim shell
  vim.opt.shell = "pwsh"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
end
