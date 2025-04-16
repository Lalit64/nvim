local map = vim.keymap.set

-- disable arrow keys
vim.cmd [[
  map <Up> <Nop>
  map <Left> <Nop>
  map <Right> <Nop>
  map <Down> <Nop>
]]

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "[F]ormat File" })

-- global lsp mappings
map("n", "<leader>cs", vim.diagnostic.setloclist, { desc = "[C]ode Locli[S]t" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })

-- tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "New buffer" })

map("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Go to next buffer" })

map("n", "<S-tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Go to prev buffer" })
map("n", "q", function()
  Snacks.bufdelete()
end, { desc = "Close buffer" })
map("n", "<leader>x", "<cmd>NoiceDismiss<cr>", { desc = "Noice Dismiss" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle Comment", remap = true })

-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "NvimTree Toggle" })
map("n", "<leader>re", "<cmd>NvimTreeResize 36<CR>", { desc = "NvimTree Resize" })

-- telescope
local builtin = require "telescope.builtin"
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>ft", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "[F]ind [W]ords" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })

-- snacks.nvim lazygit
map("n", "<leader>lg", function()
  Snacks.lazygit.open()
end, { desc = "[L]azy[G]it" })

-- lsp rename
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP [R]e[N]ame" })

-- snacks toggle terminal
map({ "n", "t" }, "<C-t>", function()
  Snacks.terminal.toggle()
end)
