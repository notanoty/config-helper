vim = vim
local M = {}

function M.setup()
  -- Your plugin setup code here
  vim.cmd('echo "configHelper loaded"')
  -- Additional setup...
  require("configHelper.core")

  require("configHelper.commands")

  require("configHelper.mappings")

  require("configHelper.autocommands")

end

return M
