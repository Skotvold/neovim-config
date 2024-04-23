local M = {}

function M.ManageInlayHints(enable)
    if enable then
        vim.lsp.inlay_hint.enable(true, {
            options = {
                type_hints = true,
                parameter_hints = true,
                label_hints = true,
            }
        })
        print("Inlay hints enabled globally")
    else
        vim.lsp.inlay_hint.enable(false)
        print("Inlay hints disabled globally")
    end
    vim.g.inlay_hints_enabled = enable
end

function M.ToggleInlayHints()
    M.ManageInlayHints(not vim.g.inlay_hints_enabled)
end

return M
