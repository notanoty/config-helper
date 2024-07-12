vim = vim -- I need to write this because my lsp is very annoying


vim.api.nvim_set_keymap("n", "<leader>gf", ":GoByPath<CR>" , { noremap = true, silent = true })
