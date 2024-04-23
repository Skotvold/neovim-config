require "nvchad.mappings"

local inlay_hints = require "configs/inlay_hints"
local map =vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


-- toggle global custom functions
map('n', '<leader>td', '<cmd>lua toggle_diagnostics_in_insert_mode()<CR>', {
  noremap = true, silent = true, desc="Toggle insert mode lsp"
})

map('n', '<leader>ti', function () inlay_hints.ToggleInlayHints() end,
  { noremap = true, silent = true, desc =   "Toggle inlay hints"
})
