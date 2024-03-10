local c = require("lienchi.colors").lienchi
local options = require("lienchi.config").options

return {
  Normal = { bg = c.bg, fg = c.fg },
  Pmenu = { bg = c.bg_popup, fg = c.fg },
  Comment = { fg = c.comment, style = options.styles.comments },
  ColorColumn = { bg = c.black },
  Cursor = { fg = c.bg, bg = c.fg },
  lCursor = { fg = c.bg, bg = c.fg },
  CursorLine = { bg = c.bg_highlight },
}
