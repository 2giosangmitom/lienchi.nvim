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

function M.darken(hex, amount, bg) return M.blend(hex, bg, amount) end

function M.lighten(hex, amount, fg) return M.blend(hex, fg, amount) end

function M.terminal(colors) end

return M
