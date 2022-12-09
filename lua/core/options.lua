local options = {
  listchars     = {
    -- tab      = "│·",
    tab         = "» ",
    -- trail       = "·",
    -- space       = "⋅",
    -- precedes = "←",
    extends     = "→",
    -- eol         = "↩",
    -- nbsp     = "␣",
  },

  fillchars     = {
    eob       = " ",
    diff      = "╱",
    foldopen  = "",
    foldsep   = "│",
    foldclose = "»"
  },

  list          = true,
  scrolloff = 10,
  cursorline = true,
  autoindent = true,

  termguicolors = true,
  signcolumn    = "yes",
  encoding      = "UTF-8",
  background    = "dark",
  ignorecase    = true,
  smartcase     = true,
  cmdheight     = 1,
  foldmethod    = "indent",
  foldlevel     = 99,
  updatetime    = 2000,
  timeoutlen    = 500,
  hidden        = true,
  splitbelow    = true,
  splitright    = true,
  ts            = 2,
  sw            = 2,
  expandtab     = true,
  re            = 0,
  number        = true,
  wrap          = false,
  linebreak     = true,
  swapfile      = false,
  incsearch     = true,
  laststatus    = 3,
  clipboard     ="unnamedplus",


}

for option, value in pairs(options) do
  vim.opt[option] = value
end

