return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        enabled = false,
      },
      suggestion = {
        auto_trigger = true,
        enabled = true,
        keymap = {
          accept = "<C-Tab>",
        },
      },
    })
  end,
}
