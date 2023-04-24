-- User AstroFile : Triggered after opening a file
-- VeryLazy : Triggered after opening a file
-- BufEnter *.lua : Triggered after opening a Lua file
-- InsertEnter : Triggered after entering insert mode
-- LspAttach : Triggered after staring LSPs
return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- Lua
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = "User AstroFile",
    cmd = { "TodoQuickFix" },
  },
  ----------------------- 移动插件 --------------------------------------
  {
    "ggandor/leap.nvim",
    opts = {
      highlight_unlabeled_phase_one_targets = true,
      safe_labels = {},
    },
    event = "User AstroFile",
  },
  -- vim surround插件
  {
    "kylechui/nvim-surround",
    opts = {},
    event = "User AstroFile",
  },
  ----------------------- 替换和交换插件 --------------------------------
  {
    "gbprod/substitute.nvim",
    opts = {
      on_substitute = nil,
      yank_substituted_text = false,
      highlight_substituted_text = {
        enabled = true,
        timer = 500,
      },
      range = {
        prefix = "s",
        prompt_current_text = false,
        confirm = false,
        complete_word = false,
        motion1 = false,
        motion2 = false,
        suffix = "",
      },
      exchange = {
        motion = false,
        use_esc_to_cancel = true,
      },
    },
    event = "User AstroFile",
  },
  ------------------------ 多窗口聚焦提示 -------------------
  {
    "nvim-zh/colorful-winsep.nvim",
    event = "WinNew",
    opts = {},
  },
  ----------------------- emmet ---------------------------
  {
    "mattn/emmet-vim",
    event = "User AstroFile",
  },
  ----------------------- synthwave84 ----------------------
  -- {
  --   "lunarvim/synthwave84.nvim",
  --   opts = {
  --     glow = {
  --       error_msg = true,
  --       type2 = true,
  --       func = true,
  --       keyword = true,
  --       operator = true,
  --       buffer_current_target = true,
  --       buffer_visible_target = true,
  --       buffer_inactive_target = true,
  --     },
  --   },
  -- },
  --------------------- rainbow2 -------------------------
  {
    "HiPhish/nvim-ts-rainbow2",
    event = "User AstroFile",
    config = function()
      local rainbow = require "ts-rainbow"
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          query = "rainbow-parens",
          strategy = rainbow.strategy.global,
          hlgroups = {
            "TSRainbowRed",
            "TSRainbowYellow",
            "TSRainbowBlue",
            "TSRainbowOrange",
            "TSRainbowGreen",
            "TSRainbowViolet",
            "TSRainbowCyan",
          },
        },
      }
    end,
  },
}
