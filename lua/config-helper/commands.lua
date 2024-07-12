vim = vim -- I need to write this because my lsp is very annoying

local core = require("config-helper.core")

vim.api.nvim_create_user_command("CreatTest", function()
  core.create_file_in_directory()
end, {})

vim.api.nvim_create_user_command("GoByPath", function()
  core.go_by_path()
end, {})
