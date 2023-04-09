-- local colorscheme = "tokyonight-night"
local colorscheme = "bluloco-dark"

require("bluloco").setup({
  style = "auto",
  transparent = false,
  italics = true,
  terminal = vim.fn.has("gui_running") == 1 -- bluoco colors are enabled in gui terminals per default.
})

vim.cmd('colorscheme bluloco-dark')
local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
  return
end
