return {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',  -- Automatically update parsers after installation
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { "markdown", "markdown_inline" }, -- Add languages you need
      highlight = {
        enable = true,  -- Enable treesitter-based syntax highlighting
        additional_vim_regex_highlighting = true,
      },
    })
  end
}
