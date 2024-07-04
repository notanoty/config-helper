vim = vim
local M = {}
function M.hello_world_function()
  print("Hello, World function!")
end

function M.show_time()
  print("Current time: " .. os.date())
end

function M.show_randm_number()
  print("Random number: " .. math.random(1, 100))
end

function M.print_text()
  local text = vim.fn.input("Enter your text: ")

  local cwd = vim.loop.cwd()
  print("Current directory: " .. cwd)
  print("Your text is: " .. text)
end

function M.create_file_in_directory()
  local cwd = vim.loop.cwd()
  local file_name = vim.fn.input("Enter file name ( us / if you want to make directory): ")
  local filepath = cwd .. "/" .. file_name
  local file = io.open(filepath, "w")
  if file then
    file:close()
    print("File created at: " .. filepath)
  else
    print("Failed to create file at: " .. filepath)
  end
end

local function get_full_word_under_cursor()
  local line = vim.api.nvim_get_current_line()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local cursor_col = cursor_pos[2] + 1

  local word_start, word_end = cursor_col, cursor_col

  while word_start > 1 and line:sub(word_start - 1, word_start - 1):match("[_%w./]") do
    word_start = word_start - 1
  end

  while word_end <= #line and line:sub(word_end, word_end):match("[_%w./]") do
    word_end = word_end + 1
  end

  return line:sub(word_start, word_end - 1)
end

local function is_path(word)
  return true
end
-- /bin/vim
-- aaa
-- ./config.lua

function M.go_by_path()
  -- Get the current cursor position
  local path = get_full_word_under_cursor()
  print(path)
  if is_path(path) then
    print(path .. " is a path")
  else
    print(path .. " is not a path")
  end
  vim.api.nvim_command("edit" .. path)
end

return M
