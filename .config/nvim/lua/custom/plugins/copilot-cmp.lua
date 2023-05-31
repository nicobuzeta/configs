return {
  "zbirenbaum/copilot-cmp",
  requires = {
    "hrsh7th/nvim-cmp",
    "zbirenbaum/copilot.lua",
   },
  config = function()
    require("copilot_cmp").setup()
  end,
}

