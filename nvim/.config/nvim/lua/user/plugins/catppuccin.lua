return {
  "catppuccin/nvim", 
  name = "catppuccin", 
  priority = 1000,
  config = function()
    require("catppuccin").setup {
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        which_key = true,
      }
    }
    vim.cmd.colorscheme "catppuccin-mocha"
  end,
}
