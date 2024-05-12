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

-- LSP mappings 
map("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "LSP go to definition" })
map("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "LSP go to declaration" })
map("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "LSP go to references" })
map("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "LSP go to implementation" })
map("n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "LSP hover" })
map("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "LSP signature help" })
map("n", "<leader>gp", function() Peek_definition() end, { desc = "LSP peek definition", noremap = true, silent = true })
map("n", "<leader>gR", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "LSP rename" })

function Peek_definition()
    -- Get the current cursor position and request the definition from the LSP
    local params = vim.lsp.util.make_position_params()
    vim.lsp.buf_request(0, 'textDocument/definition', params, function(err, result, ctx, config)
        if err then
            vim.notify('Error on Peek Definition: ' .. tostring(err), vim.log.levels.ERROR)
            return
        end
        if not result or vim.tbl_isempty(result) then
            vim.notify("No definition found", vim.log.levels.INFO)
            return
        end
        -- Use Neovim's util to preview the location in a floating window
        vim.lsp.util.preview_location(result[1], { border = 'single' })
    end)
end
