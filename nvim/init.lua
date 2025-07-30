-- Function to load all plugin configurations from a directory
local function load_plugins_from(dir)
  local plugins = {}
  local path = vim.fn.stdpath('config') .. '/lua/' .. dir
  for _, file in ipairs(vim.fn.readdir(path)) do
    local plugin = require(dir .. '.' .. file:gsub('%.lua$', ''))
    table.insert(plugins, plugin)
  end
  return plugins
end

-- Load lazy.nvim
vim.opt.rtp:prepend('~/.local/share/nvim/site/pack/lazy/start/lazy.nvim')
require('lazy').setup(load_plugins_from('plugins'))

-- Additional Neovim configuration can go here
-- Enable arrow keys in command-line mode
vim.api.nvim_set_keymap('c', '<Up>', '<C-p>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('c', '<Down>', '<C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('c', '<Left>', '<C-b>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('c', '<Right>', '<C-f>', { noremap = true, silent = true })

-- Move lines with Ctrl+j/k/Up/Down
local opts = { noremap = true, silent = true }

-- Define mappings
local mappings = {
  n = {
    ['<C-j>'] = ':m .+1<CR>==',
    ['<C-k>'] = ':m .-2<CR>==',
    ['<C-Down>'] = ':m .+1<CR>==',
    ['<C-Up>'] = ':m .-2<CR>==',
  },
  i = {
    ['<C-j>'] = '<Esc>:m .+1<CR>==gi',
    ['<C-k>'] = '<Esc>:m .-2<CR>==gi',
    ['<C-Down>'] = '<Esc>:m .+1<CR>==gi',
    ['<C-Up>'] = '<Esc>:m .-2<CR>==gi',
  },
  v = {
    ['<C-j>'] = ":m '>+1<CR>gv=gv",
    ['<C-k>'] = ":m '<-2<CR>gv=gv",
    ['<C-Down>'] = ":m '>+1<CR>gv=gv",
    ['<C-Up>'] = ":m '<-2<CR>gv=gv",
  }
}

-- Apply mappings
for mode, mode_mappings in pairs(mappings) do
  for key, cmd in pairs(mode_mappings) do
    vim.keymap.set(mode, key, cmd, opts)
  end
end

-- Global Clipboard
vim.opt.clipboard = "unnamedplus"




-- Make command-line completion case-insensitive
vim.opt.wildignorecase = true

-- Make searches in the command-line mode case-insensitive
vim.opt.ignorecase = true

