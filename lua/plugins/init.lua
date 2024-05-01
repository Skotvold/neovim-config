return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "configs.null-ls"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git =  { enable = true }
    }
  },

  {
    'smoka7/hop.nvim',
    version = "*",
    opts = {
      multi_windows = true,
      keys = 'etovxqpdygfblzhckisuran',
      uppercase_labels = true,
      quit_key = '<SPC>',
      jump_on_sole_occurence = false,
      case_insensitive = false,
      hint_offset = -1
    },
    keys = {
      {
        "<leader>fj",
        function()
          require("hop").hint_words()
        end,
        mode = {"n", "x", "o" },
        desc = "use hop mode to navigate the buffer"
      }
    }
  },

  {
     "neovim/nvim-lspconfig",
     config = function()
       require("nvchad.configs.lspconfig").defaults()
       require "configs.lspconfig"
     end,
  },


  {
  	"williamboman/mason.nvim",
   	opts = {
   		ensure_installed = {
   			"lua-language-server",
   			"html-lsp",
        "css-lsp",

        -- Stylers
        "prettier",
        "stylua",
        "golines",
        "goimports",
        "gofumpt",

        -- system langauges
        "gopls",
        "ols",
        "htmx-lsp"
   		},
   	},
  },

  {
   	"nvim-treesitter/nvim-treesitter",
   	opts = {
   		ensure_installed = {
        -- script languages
   			"vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",

        -- system languages
        "c",
        "cpp",
        "go",
        "rust",

        -- "non-programming syntax
        "toml",
        "http",
        "json",
        "markdown",
        "markdown_inline"
   		},
   	},
  },


{
  "github/copilot.vim",
  lazy = false,
  config = function()  -- Mapping tab is already used by NvChad
    vim.g.copilot_no_tab_map = true;
    vim.g.copilot_assume_mapped = true;
    vim.g.copilot_tab_fallback = "";
  -- The mapping is set to other key, see custom/lua/mappings
  -- or run <leader>ch to see copilot mapping section
  end
  },
}
