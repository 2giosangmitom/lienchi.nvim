local M = {}

local defaults = {
  styles = {
    comments = { italic = true },
  },
}

M.options = {}

function M.setup(opts) M.options = vim.tbl_deep_extend("force", defaults, opts or {}) end

return M
