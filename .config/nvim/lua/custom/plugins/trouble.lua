return {
  "folke/trouble.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  },
  config = function ()
    require('trouble').setup({
      mode = "workspace_diagnostics",
    })
  end,
}
