local util = require("lienchi.util")
local theme = require("lienchi.theme")
local config = require("lienchi.config")

local M = {}

function M._load(style)
  if style and not M._style then M._style = require("lienchi.config").options.style end
  if not style and M._style then
    require("lienchi.config").options.style = M._style
    M._style = nil
  end
  M.load({ style = style, use_background = style == nil })
end

function M.load(opts)
  if opts then require("lienchi.config").extend(opts) end
  util.load(theme.setup())
end

M.setup = config.setup

M.colorscheme = M.load

return M
