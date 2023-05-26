-- :e 重新加载语言分析服务
-- :LSPInstall lua_ls
-- customize mason plugins
local lsp_type = require("user.config.lsp_type").lsp_type

local getEvent = function()
  if lsp_type == 'coc' then
    return "User AstroFile"
  else
    return "LspAttach"
  end
end

return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      -- automatic_installation = true,
      ensure_installed = {
        "lua_ls",
        "clangd",
        "cssls",
        "html",
        "marksman",
        "jsonls",
        "pyright",
        "tsserver",
        "yamlls",
        "emmet_ls",
        "ruff_lsp",
        "jdtls",
        "lemminx",
        "volar",
        "tailwindcss",
        "prismals"
      },
    },
  },
  -- :NullLSInstall stylua
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      -- automatic_installation = true,
      ensure_installed = {
        "prettierd",
        "stylua",
        "eslint_d",
        "black",
        "isort",
        "clang_format",
      },
      handlers = {
        -- for prettier
        prettier = function()
          require("null-ls").register(require("null-ls").builtins.formatting.prettier.with {
            condition = function(utils)
              return nil
              -- return utils.root_has_file "package.json"
              --     or utils.root_has_file ".prettierrc"
              --     or utils.root_has_file ".prettierrc.json"
              --     or utils.root_has_file ".prettierrc.js"
            end,
          })
        end,
        -- for prettierd
        prettierd = function()
          require("null-ls").register(require("null-ls").builtins.formatting.prettierd.with {
            condition = function(utils)
              return utils.root_has_file "package.json"
                  or utils.root_has_file ".prettierrc"
                  or utils.root_has_file ".prettierrc.json"
                  or utils.root_has_file ".prettierrc.js"
            end,
          })
        end,
        -- For eslint_d:
        eslint_d = function()
          require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with {
            condition = function(utils)
              return utils.root_has_file ".eslintrc.cjs"
                  or utils.root_has_file ".eslintrc.json"
                  or utils.root_has_file ".eslintrc.js"
            end,
          })
        end,
      },
      -- {
      --   command = "stylua",
      -- },
      -- {
      --   command = "black",
      --   filetypes = { "python" },
      -- },
      -- {
      --   command = "eslint_d",
      --   filetypes = { "typescript", "typescriptreact" },
      -- },
      -- {
      --   command = "prettier",
      --   extra_args = { "--print-width", "100" },
      --   filetypes = { "javascript" },
      -- },
    },
  },
  -- :DapInstall python
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      automatic_installation = true,
      ensure_installed = { "python", "javadbg", "javatest", "js" },
    },
  },
  -- <leader>lh触发
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup {
        noice = true,
        hint_prefix = " ",
      }
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
    event = getEvent(),
    opts = {
      commented = true,
      enabled = true,          -- enable this plugin (the default)
      enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = { "mfussenegger/nvim-dap" },
    event = getEvent(),
    config = function() require("dap-python").setup("python", {}) end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function() require("refactoring").setup {} end,
  },
}
