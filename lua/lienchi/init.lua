local M = {}

local function _load(theme)
  if vim.g.colors_name then vim.cmd("hi clear") end
  vim.o.termguicolors = true
  vim.g.colors_name = "lienchi"

  for group, hl in pairs(theme.highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end

  if theme.config.term_colors then require("lienchi.utils").terminal(theme.colors) end
end

function M.load() _load(require("lienchi.theme").setup()) end

M.setup = require("lienchi.config").setup

return M
