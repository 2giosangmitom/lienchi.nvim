local M = {}

M.colors = {}

function M.setup()
  local config = require("lienchi.config")
  local options = config.options
  local colors = require("lienchi.colors")

  local theme = {
    config = options,
    colors = colors.setup(),
    highlights = {},
  }

  M.colors = theme.colors

  local groups = { "core" }
  for _, group in ipairs(groups) do
    theme.highlights = vim.tbl_deep_extend("force", theme.highlights, require("lienchi.groups." .. group))
  end

  return theme
end

return M
