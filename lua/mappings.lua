require "nvchad.mappings"

local inlay_hints = require "configs/inlay_hints"
local map =vim.keymap.set
-- local opts = { noremap = true}

-- Navigation
map("n", "<leader>ss", ":split<CR>", { desc = "split pane on side" })
map("n", "<leader>sv", ":vsplit<CR>", { desc = "split pane on below" })
map("n", "<leader>sq", ":close<CR>", { desc = "close a pane"})

-- General neovim commands 
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Github Copilot
map("n", "<leader>cpe", 'copilot#Enable()', { noremap = true, silent = true, desc = "Enable copilot" })
map("n", "<leader>cpd", 'copilot#Disable()', { noremap = true, silent = true, desc = "Disable copilot" })
map("n", "<leader>cpn", 'copilot#Next()', { noremap = true, silent = true, expr = true, desc = "Next copilot suggestion" })
-- map("i", "<leader>cp", 'copilot#Accept("<CR>")', { noremap = true, silent = true, expr = true, desc = "Accept copilot suggestion" })

-- Visual block mode
map("n", "vm", "<C-v>", { noremap = true, silent = true, desc = "visual block mode setup" })

-- toggle global custom functions
map('n', '<leader>td', '<cmd>lua toggle_diagnostics_in_insert_mode()<CR>', {
  noremap = true, silent = true, desc="Toggle insert mode lsp"
})

map('n', '<leader>ti', function () inlay_hints.ToggleInlayHints() end,
  { noremap = true, silent = true, desc =   "Toggle inlay hints"
})
