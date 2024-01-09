---autoformat
local fmtGroup = vim.api.nvim_create_augroup("Autoformat", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = fmtGroup,
  pattern = "*",
  callback = function()
    local filetype = vim.bo.filetype
    local clients = vim.lsp.get_active_clients()

    local client
    for _, c in ipairs(clients) do
      for _, ft in ipairs(c.config.filetypes) do
        if ft == filetype then
          client = c
          break
        end
      end

      if client then
        break
      end
    end

    if client and client.server_capabilities.documentFormattingProvider then
      vim.lsp.buf.format({ async = false })
    end
  end
})
