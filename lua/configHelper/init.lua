local function hello_world_function()
  print("Hello, World function!")
end

local function show_time()
  print("Current time: " .. os.date())
end

local function show_randm_number()
  print("Random number: " .. math.random(1, 100))
end

local function print_text()
  -- Prompt the user for input
  local text = vim.fn.input("Enter your text: ")
  -- Print the received text
  local cwd = vim.loop.cwd()
  print("Current directory: " .. cwd)
  print("Your text is: " .. text)
end

local function create_file_in_directory(directory, filename)
  local cwd = vim.loop.cwd()
  local file_name = vim.fn.input("Enter file name ( us / if you want to make directory): ")
  local filepath = cwd .. "/" .. file_name
  local file = io.open(filepath, "w") -- "w" mode to create or truncate the file
  if file then
    file:write(" софрони долбаеб") -- Write an empty string to the file
    file:close()
    print("File created at: " .. filepath)
  else
    print("Failed to create file at: " .. filepath)
  end
end

vim.api.nvim_create_user_command("ShowTime", function()
  show_time()
end, {})
vim.api.nvim_create_user_command("ShowRandomNumber", function()
  show_randm_number()
end, {})
vim.api.nvim_create_user_command("PrintText", function()
  print_text()
end, {})
vim.api.nvim_create_user_command("CreatTest", function()
  create_file_in_directory()
end, {})

print("Config Helper plugin is loaded!")
return {
  hello_world_function = hello_world_function,
  show_time = show_time,
  show_randm_number = show_randm_number,
  print_text = print_text,
  create_file_in_directory = create_file_in_directory,
}
