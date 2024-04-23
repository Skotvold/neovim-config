require "nvchad.options"

-- add yours here!
vim.opt.relativenumber = true

if vim.fn.has("win32") == 1 or vim.fn.has("win32unix") == 1 then
-- setup neovim shell
  vim.opt.shell = "pwsh"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
end

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
function ToggleInlayHints()
    vim.g.inlay_hints_enabled = not vim.g.inlay_hints_enabled  -- Toggle the state

    if vim.g.inlay_hints_enabled then
        vim.lsp.inlay_hint.enable(true, {  -- Enable inlay hints globally
            options = {
                type_hints = true,
                parameter_hints = true,
                label_hints = true,
            }
        })
        print("Inlay hints enabled globally")
    else
        vim.lsp.inlay_hint.enable(false)  -- Disable inlay hints globally
        print("Inlay hints disabled globally")
    end
end
