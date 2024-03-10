local util = require("lienchi.util")
local theme = require("lienchi.theme")
local config = require("lienchi.config")

local M = {}

function M.load() util.load(theme.setup()) end

M.setup = config.setup

return M
