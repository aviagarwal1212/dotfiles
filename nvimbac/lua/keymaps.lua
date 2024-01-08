---key
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = "File browser" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover docs" })
vim.keymap.set('n', '\\', require("telescope.builtin").buffers, { desc = "Buffers" })

---space+key
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { desc = "Type definition" })
vim.keymap.set('n', '<space>r', function()
  require("trouble").toggle("lsp_references")
end, { desc = "Toggle LSP references" })
vim.keymap.set({ 'n', 'v' }, '<space>a', vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set('n', '<space>f', require("telescope.builtin").find_files, { desc = "Find files" })
vim.keymap.set('n', '<space>g', require("telescope.builtin").live_grep, { desc = "Grep" })
vim.keymap.set('n', '<space>\\', require("telescope.builtin").oldfiles, { desc = "Recent files" })
vim.keymap.set('n', '<space>d', function() require("trouble").toggle() end, { desc = "Toggle diagnostics" })
vim.keymap.set('n', '<space>u', "<CMD>Telescope undo<CR>", { desc = "Undo history" })

---g+key
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Goto declaration" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Goto definition" })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Goto implementation" })
vim.keymap.set('n', 'gr', vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set('n', 'gf', function()
  vim.lsp.buf.format { async = true }
end, { desc = "Format buffer" })

---Ctrl+key
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = "Signature help" })
vim.keymap.set('n', '<C-x>', "<CMD>:bd<CR>", { desc = "Close buffer" })

---[]+key
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {desc = "Goto previous diagnostic"})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {desc = "Goto next diagnostic"})
