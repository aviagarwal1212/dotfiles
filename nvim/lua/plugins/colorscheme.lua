return {
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        transparent_bg = false,
        italic_comments = false,
        telescope = {
          style = 'classic'
        },
        cursorline = {
          theme = 'light',
          blend = 0.8,
        },
      })
      require("nordic").load()
    end
  }
}
