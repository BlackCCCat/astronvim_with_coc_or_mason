return {
{ import = "astrocommunity.completion.copilot-lua" },
{
 "zbirenbaum/copilot.lua",
  opts = {
    suggestion = {
      enabled = false,
      auto_trigger = false,
      debounce = 150,
      keymap = {
        accept = "<C-;>",
        accept_word = false,
        accept_line = false,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
  },
},
}
