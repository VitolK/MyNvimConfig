vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
vim.opt.relativenumber = true


require("lazy").setup("plugins")
--require('mason').setup()
--require("mason-lspconfig").setup()
--require("lspconfig").lua_ls.setup {}
--require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  --function (server_name) -- default handler (optional)
    --require("lspconfig")[server_name].setup {}
  --end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the rust_analyzer:
  --["rust_analyzer"] = function ()
    --require("rust-tools").setup {}
  --end
--}

local builtin = require("telescope.builtin")

vim.keymap.set('n', '<C-p>',builtin.find_files, {})
vim.keymap.set('n', '<leader>fg',builtin.live_grep, {})
--Neotree
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
vim.keymap.set('n', '<leader>gi', ':Neotree float git_status<CR>', {})

--COPY SHIT:
--vim.keymap.set('n', '<leader>a', '\"*y', {})
--vim.keymap.set('n', '<leader>y', '\"+y', {})
--vim.keymap.set('n', '<leader>Y', '\"+yg', {})
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true })


local configs = require("nvim-treesitter.configs")
configs.setup({
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html","python" },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },  
})
--require("lazy").setup({{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}})
--require("dracula").setup()
--vim.cmd.colorscheme "dracula"
