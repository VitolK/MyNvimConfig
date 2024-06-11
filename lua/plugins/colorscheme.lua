return {
  -- add dracula
  { "Mofiqul/dracula.nvim" },

  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
  config= function()
    vim.cmd.colorscheme "dracula"
  end
}


--require("dracula").setup()
