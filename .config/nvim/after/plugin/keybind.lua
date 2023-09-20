local wk               = require("which-key")

local telescope_builin = require('telescope.builtin')

local Terminal         = require('toggleterm.terminal').Terminal
local lazygit          = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function _lazy_git_toggle()
  lazygit:toggle()
end

wk.register({
  -- Neotree binds
  e = { "<cmd>Neotree action=focus<cr>", "Focus Neotree" },
  ['0'] = { "<cmd>Neotree reveal<cr>", "Focus Neotree on current file" },
  E = { "<cmd>Neotree action=focus toggle<cr>", "Toggle Neotree" },
  -- Previous Buffers
  ["<tab>"] = { "<cmd>b#<cr>", "Previous buffer" },
  -- Telescope Buffers
  ["<space>"] = { telescope_builin.buffers, "Find Open Buffers" },
  -- Trouble binds
  x = {
    name = 'Trouble',
    x = { "<cmd>TroubleToggle<cr>", "Diagnostics" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
    -- t = {"<cmd>TroubleToggle lsp_references<cr>", "Workspace Diagnostics"},
    t = { "<cmd>TodoTrouble<cr>", "Project Todos" },
    -- h = {vim.diagnostic.open_float, "Open Diagnostics"},
  },
  -- Telescope binds
  f = {
    name = 'Files',
    s = { "<cmd>write<cr>", "Save file" },
    f = { telescope_builin.find_files, "Find Files" },
    o = { telescope_builin.oldfiles, "Find Recent Files" },
    b = { telescope_builin.buffers, "Find Open Buffers" },
    d = { telescope_builin.diagnostics, "Diagnostics" },
    g = { telescope_builin.live_grep, "Search" },
    G = { telescope_builin.grep_string, "Search Current String" },
    t = { "<cmd>TodoTelescope<cr>", "Project Todos" },
    p = { "<cmd>let @+=expand('%:p')<cr>", "Current Buffer Path" },
    P = { "<cmd>let @+=expand('%:p') . ':' . line('.')<cr>", "Current Buffer Path" },
    F = { vim.lsp.buf.format, "Format Buffer" }
  },
  -- Tab binds
  t = {
    name = 'Tabs',
    N = { "<cmd>tabnew<cr>", "New Tab" },
    b = { "<cmd>tabprevious<cr>", "Previous Tab" },
    n = { "<cmd>tabnext<cr>", "Next Tab" },
    c = { "<cmd>tabclose<cr>", "Close Tab" },
    C = { "<cmd>tabonly<cr>", "Close All Other Tabs" },
  },
  -- Buffer binds
  b = {
    name = 'Buffers',
    b = { "<cmd>TablineBufferPrevious<cr>", "Previous Buffer" },
    n = { "<cmd>TablineBufferNext<cr>", "Next Buffer" },
    c = { "<cmd>Bdelete<cr>", "Close Buffer" },
    C = { "<cmd>bufdo Bdelete<cr>", "Close All Buffers" },
  },
  -- Window binds
  w = {
    name = "Windows",
    h = { "<c-w><h>", "Left Window" },
    j = { "<cmd>wincmd j<cr>", "Down Window" },
    k = { "<cmd>wincmd k<cr>", "Up Window" },
    l = { "<c-w><l>", "Right Window" },
    ["<tab>"] = { "<c-w><c-p>", "Previous Window" },
  },
  -- Quit
  q = {
    name = "Quit",
    q = { "<cmd>quitall<cr>", "Quit All No Save" },
  },
  l = { "<cmd>lua _lazy_git_toggle()<cr>", "Lazygit" },
  d = {
    name = "Debug",
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    C = { "<cmd>lua require'dap'.terminate()<cr>", "Disconnect" },
    l = { "<cmd>lua require'dap'.run_last()<cr>", "Repeat Last" },
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    B = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Set Breakpoint" },
    s = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    O = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    r = { "<cmd>lua require'dap'.repl.open()<cr>", "Open REPL" },
    u = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
  }
}, { prefix = "<leader>" })


-- Bind control s to save file in normal mode (command mode)
vim.api.nvim_set_keymap("n", "<C-s>", "<cmd>write<cr>", { noremap = true, silent = true })

-- Move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move half page up and down while mantaining cursor middle of page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- WhichKey show registers
vim.keymap.set("n", "\"", "<cmd>lua require('which-key').show('\"', {mode = 'n', auto = true})<cr>")
