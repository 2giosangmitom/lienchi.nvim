local M = {}

local function hex2rbg(c)
  c = string.lower(c)
  local r = tonumber(c:sub(2, 3), 16)
  local g = tonumber(c:sub(4, 5), 16)
  local b = tonumber(c:sub(6, 7), 16)
  return { r, g, b }
end

function M.blend(foreground, background, alpha)
  alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
  local bg = hex2rbg(background)
  local fg = hex2rbg(foreground)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.darken(hex, amount, bg) return M.blend(hex, bg or M.bg, amount) end

function M.lighten(hex, amount, fg) return M.blend(hex, fg or M.fg, amount) end

function M.terminal(colors) end

function M.invert_colors(colors)
  if type(colors) == "string" then return M.invert_color(colors) end
  for key, value in pairs(colors) do
    colors[key] = M.invert_colors(value)
  end
  return colors
end

function M.invert_highlights(hls)
  for _, hl in pairs(hls) do
    if hl.fg then hl.fg = M.invert_color(hl.fg) end
    if hl.bg then hl.bg = M.invert_color(hl.bg) end
    if hl.sp then hl.sp = M.invert_color(hl.sp) end
  end
end

function M.load(theme)
  if vim.g.colors_name then vim.cmd("hi clear") end
  vim.o.termguicolors = true
  vim.g.colors_name = "lienchi"

  for group, hl in pairs(theme.highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end

  if theme.config.terminal_colors then M.terminal(theme.colors) end
end

return M
