vim = vim

local function get_full_word_under_cursor()
  local line = vim.api.nvim_get_current_line()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local cursor_col = cursor_pos[2] + 1

  local word_start, word_end = cursor_col, cursor_col

  while word_start > 1 and line:sub(word_start - 1, word_start - 1):match("[~$_%w./]") do
    word_start = word_start - 1
  end

  while word_end <= #line and line:sub(word_end, word_end):match("[~$_%w./]") do
    word_end = word_end + 1
  end

  return line:sub(word_start, word_end - 1)
end



local function is_path(path)
  print("The path is: (" .. path .. ")")
  if path == "" then return false
  end
  -- print("Path checker(case 1): " .. string.match(path, "[/%a+1]+"))
  -- print("Path checker(case 2): " .. string.match(path, "[~/%a+][/%a]+"))
  if path == string.match(path, "[/%a]+") then
    return true
  elseif path == string.match(path, "[~/%a+][/%a]*")  then
    return true
  elseif path == string.match(path, "[./%a+][/%a]*")  then
    return true
  end
  return false
end

local function get_current_buffer_content()
    local buf = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    return lines
end

local function search_word(lines, word)
  local path = nil
  for i = 1, #lines, 1 do
    if string.match(lines[i], word) then
      path = string.match(lines[i], word .." *= *(.*)")
      break
    end
  end

  if path ~= nil then
    return path
  else
    print("Variable was not found")
    return ""
  end
end


local M = {}


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


-- ~/aaa
-- /aaa/aaa//
-- /test/test/a
-- $test = ~/Desktop
-- $test/programming/
function M.go_by_path()
  local path = get_full_word_under_cursor()
  local word =nil 
  word = string.match(path, "($%a+)")
  local has_search = true
  if word == nil then
    has_search = false
  else
    path = string.gsub(path, word, "")
  end

  if is_path(path) then
    local lines = get_current_buffer_content()
    if has_search then
      local searched_word = search_word(lines, word)
      print("Path (correct search_word): " .. searched_word .. path)
      vim.api.nvim_command("edit" .. searched_word .. path)
    else
      print("Path (correct no search_word): " .. path)
      vim.api.nvim_command("edit" .. path)
    end
  else
    print("Path (incoreect): "  .. path)
  end
end

return M
