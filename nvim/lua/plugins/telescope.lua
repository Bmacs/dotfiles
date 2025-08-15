return {
  'nvim-telescope/telescope.nvim',
  config = function()
    require('telescope').setup({
      defaults = {
        -- Your Telescope configuration goes here
      }
    })

    -- Keymaps should be set after setup, not inside defaults!
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', 'ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', 'fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', 'fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', 'fh', builtin.help_tags, { desc = 'Telescope help tags' })
  end
}

