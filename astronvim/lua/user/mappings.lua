return {
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", desc = "move line down" },
    ["K"] = { ":m '<-2<CR>gv=gv", desc = "move line up" },
    ["<Tab>"] = { ">>", desc = "indent line" },
    ["<S-Tab>"] = { "<<", desc = "reverse indent line" }
  },
  n = {
    ["<Tab>"] = { ">>", desc = "indent line" },
    ["<S-Tab>"] = { "<<", desc = "reverse indent line" },
    [":c"] = { ":bd", desc = "close current buffer" }
  }
}
