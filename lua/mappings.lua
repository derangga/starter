require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "K", vim.lsp.buf.hover, { desc = "Hover code" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Lsp [C]ode [A]ction" })
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
