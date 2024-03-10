local M = {}

M.setup = require("lienchi.config").setup

function M.load()
  if vim.g.colors_name then vim.cmd("hi clear") end
  vim.opt.termguicolors = true
  vim.opt.background = "dark"
  vim.g.colors_name = "lienchi"

  local highlights = {}
  local groups = {
    "editor",
    "lazy",
    "illuminate",
  }
  for _, group in ipairs(groups) do
    highlights = vim.tbl_extend("force", highlights, require("lienchi.groups." .. group))
  end

  for group, hl in pairs(highlights) do
    require("lienchi.utils").highlight(group, hl)
  end
end

return M
