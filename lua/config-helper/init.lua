vim = vim
local M = {}

function M.setup()
  -- Your plugin setup code here
  -- Additional setup...
  -- print("Hello world")

  require("config-helper.core")

  require("config-helper.commands")

  require("config-helper.mappings")

  require("config-helper.autocommands")

end

return M
