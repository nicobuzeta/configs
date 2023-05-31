-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    {
      's1n7ax/nvim-window-picker',
      tag = 'v1.*',
      config = function()
          require'window-picker'.setup()
      end,
    }
  },
  config = function ()
    require('neo-tree').setup({
      window = {
        mappings = {
          ["l"] = "open",
        }
      }
    })
  end,
}
