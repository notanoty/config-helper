vim = vim
local M = {}

function M.setup()
  -- Your plugin setup code here
  vim.cmd('echo "config-helper is loaded"')
  -- Additional setup...
  require("config-helper.core")

  require("config-helper.commands")

  require("config-helper.mappings")

  require("config-helper.autocommands")

end

return M
