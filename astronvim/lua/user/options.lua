return {
  opt = {
    -- mouse settings
    mouse = 'a',
    -- update buffer when file changes
    autoread = true,
    -- wrapping
    wrap = true,
    -- use system clipboard
    clipboard = 'unnamedplus',
    -- settings for backpace
    backspace = 'indent,eol,start',
    -- settings for undo history
    swapfile = false,
    backup = false,
    undodir = os.getenv('HOME') .. '/.vim/undodir',
    undofile = true,
  },
}
