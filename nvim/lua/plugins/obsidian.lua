return {
  'epwalsh/obsidian.nvim',
  requires = { 'nvim-telescope/telescope.nvim', 'hrsh7th/nvim-cmp' },
  config = function()
    require('obsidian').setup({
      dir = "/Users/bmacs/Personal",
      templates = {
        subdir = "templates",
        date_format = "%m-%d-%Y",
        time_format = "%H:%M",
      },
      completion = {
        nvim_cmp = true,
      },
      finder = "telescope.nvim"
    })

    -- Set conceal level to 2 for Markdown files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function()
        vim.opt_local.conceallevel = 2
      end,
    })
  end
}

