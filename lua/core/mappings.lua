vim.g.mapleader = " "

local keymap = vim.keymap.set

local opts = {noremap = true, silent = true}


keymap("i", "jk", "<ESC>", opts)


keymap("n","<C-n>", "<cmd> NvimTreeToggle <CR>", opts)

keymap("n","<TAB>", "<cmd> bNext <CR>", opts)
keymap("n","<S-TAB>", "<cmd> bprevious <CR>", opts)

keymap("n","=", "<cmd> vertical resize +5 <CR>", opts)
keymap("n","-", "<cmd> vertical resize -5 <CR>", opts)

keymap("n","<F9>", ":w<CR>:exec '!python3' shellescape(@%, 1)<CR>", opts)

keymap("n", "<leader>/", "<cmd> nohl <CR>", opts)
keymap("n", "<leader>js", "<cmd> %!jq .<CR>", opts)
keymap("n", "<leader>bd", "<cmd> bd! <CR>", opts)

keymap("n", "<leader>nv", "<cmd> e ~/.config/nvim/init.lua <CR>")
keymap("n", "<leader>nf", "<cmd> e new <CR>")

-- Telescope
keymap("n", "<leader>ff", "<cmd> Telescope find_files <CR>", opts)
keymap("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", opts)
keymap("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", opts)
keymap("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", opts)
keymap("n", "<leader>fb", "<cmd> Telescope buffers <CR>", opts)
keymap("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", opts)
keymap("n", "<leader>tk", "<cmd> Telescope keymaps <CR>", opts)
keymap("n", "<leader>cl", "<cmd> Telescope colorscheme <CR>", opts)



