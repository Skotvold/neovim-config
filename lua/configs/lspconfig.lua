local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "tsserver",
  "gopls"
}

local util = require "lspconfig/util"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    hint = true
  }
end

local on_attach_go = function(client, bufnr)
  -- Call the default on_attach function
  on_attach(client, bufnr)

  -- Conditionally set diagnostics handling based on the toggle
  local diagnostics_config = {
    virtual_text = true,
    signs = true,
    update_in_insert = _G.diagnostics_in_insert_mode,
    underline = true,
  }

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, diagnostics_config
  )



  if _G.diagnostics_in_insert_mode then
    print("Diagnostics in insert mode: ON for Go")
  else
    print("Diagnostics in insert mode: OFF for Go")
  end
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- go language server
lspconfig.gopls.setup {
  on_attach = on_attach_go,
  on_init = on_init,
  capabilities = capabilities,
  hint = { enable = true },
  cmd = {"gopls"},
  filetypes =  { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
        fieldalignment = true
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypesParameters = true,
        parameterNames = true,
        rangeVariableTypes = true
      }
    }
  }
}



-- Define a global flag to track state
_G.diagnostics_in_insert_mode = true

-- Function to toggle diagnostics in insert mode
function _G.toggle_diagnostics_in_insert_mode()
    _G.diagnostics_in_insert_mode = not _G.diagnostics_in_insert_mode

    if _G.diagnostics_in_insert_mode then
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = true,
                signs = true,
                update_in_insert = true,  -- Enable diagnostics in insert mode
                underline = true,
            }
        )
        print("Diagnostics in insert mode: ON")
    else
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = true,
                signs = true,
                update_in_insert = false,  -- Disable diagnostics in insert mode
                underline = true,
            }
        )
        print("Diagnostics in insert mode: OFF")
    end
end
