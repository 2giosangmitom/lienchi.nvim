local colors = require("lienchi.colors").setup({ transform = true })

local lienchi = {}

lienchi.normal = {
  a = { bg = colors.blue, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.blue },
  c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
}

lienchi.insert = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.green },
}

lienchi.command = {
  a = { bg = colors.yellow, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.yellow },
}

lienchi.visual = {
  a = { bg = colors.magenta, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.magenta },
}

lienchi.replace = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.red },
}

lienchi.terminal = {
  a = { bg = colors.green1, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.green1 },
}

lienchi.inactive = {
  a = { bg = colors.bg_statusline, fg = colors.blue },
  b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
  c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
}

return lienchi
