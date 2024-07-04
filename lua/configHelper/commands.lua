vim = vim -- I need to write this because my lsp is very annoying

local core = require("core")

vim.api.nvim_create_user_command("ShowTime", function()
  core.show_time()
end, {})
vim.api.nvim_create_user_command("ShowRandomNumber", function()
  core.show_randm_number()
end, {})
vim.api.nvim_create_user_command("PrintText", function()
  core.print_text()
end, {})
vim.api.nvim_create_user_command("CreatTest", function()
  core.create_file_in_directory()
end, {})

vim.api.nvim_create_user_command("ReadPathMy", function()
  core.go_by_path()
end, {})
