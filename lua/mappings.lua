require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


map('n', '<leader>td', '<cmd>lua toggle_diagnostics_in_insert_mode()<CR>', { noremap = true, silent = true, desc="Toggle insert mode lsp" })


map('n', '<leader>ti', '<cmd>lua ToggleInlayHints()<CR>', {
  noremap = true, silent = true, desc = "Toggle inlay hints"
})

