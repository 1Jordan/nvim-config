local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- Comment
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

which_key.register({
  ["<leader>"] = {
    d = {
      name = "Debug",
      b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
      O = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl toggle" },
      l = { "<cmd>lua require'dap'.run_last()<cr>", "Run last" },
      u = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
      t = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
    },
    l = {
      f = { "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "Format" },
    },
  },
}, opts)
