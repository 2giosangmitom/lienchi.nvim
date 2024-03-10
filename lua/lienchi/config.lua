local M = {}

local defaults = {
  term_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
  },
  integrations = {
    neo_tree = true,
    which_key = true,
  },
}

M.options = {}

function M.setup(options) M.options = vim.tbl_deep_extend("force", {}, defaults, options or {}) end

return M
