-- Plugins are managed by the built-in vim.pack. Revisions are pinned in
-- nvim-pack-lock.json. To update: `:lua vim.pack.update()`, review, then `:write`.

local function gh(repo)
  return 'https://github.com/' .. repo
end

vim.pack.add({
  -- Files
  gh('preservim/nerdtree'),
  gh('ryanoasis/vim-devicons'),
  gh('nvim-lua/plenary.nvim'),
  gh('nvim-telescope/telescope.nvim'),

  -- Code
  gh('nvim-treesitter/nvim-treesitter'),
  gh('neovim/nvim-lspconfig'),
  -- A release tag makes blink.cmp download its prebuilt fuzzy matcher.
  { src = gh('saghen/blink.cmp'), version = vim.version.range('1.x') },
  gh('stevearc/conform.nvim'),
  gh('tpope/vim-surround'),

  -- Git
  gh('lewis6991/gitsigns.nvim'),
  gh('tpope/vim-fugitive'),

  -- Interface
  gh('folke/which-key.nvim'),
  gh('nvim-tree/nvim-web-devicons'),
  gh('nvim-lualine/lualine.nvim'),
  { src = gh('dracula/vim'), name = 'dracula' },
}, { confirm = false })

vim.cmd.colorscheme('dracula')

require('lualine').setup()
require('which-key').setup()
require('gitsigns').setup()

-- File tree
vim.keymap.set('n', '<leader>t', '<cmd>NERDTreeToggle<CR>', { desc = 'Toggle file tree' })

-- Fuzzy finding
local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', function()
  telescope.find_files({ hidden = true })
end, { desc = 'Find files' })
vim.keymap.set('n', '<leader>F', function()
  telescope.find_files({ hidden = true, no_ignore = true })
end, { desc = 'Find files, including ignored' })
vim.keymap.set('n', '<leader>b', telescope.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>h', telescope.oldfiles, { desc = 'Recent files' })
vim.keymap.set('n', '<leader>g', telescope.live_grep, { desc = 'Search in files' })

require('telescope').setup({
  defaults = { file_ignore_patterns = { '^%.git/' } },
})

-- Syntax highlighting
local parsers = {
  'bash', 'css', 'diff', 'dockerfile', 'eex', 'elixir', 'erlang', 'gitcommit', 'go', 'gomod',
  'heex', 'html', 'java', 'javascript', 'json', 'kotlin', 'python', 'rust', 'swift', 'toml',
  'tsx', 'typescript', 'yaml',
}

require('nvim-treesitter').install(parsers)

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Start treesitter highlighting when a parser exists',
  callback = function(args)
    if pcall(vim.treesitter.start, args.buf) then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

-- Completion
require('blink.cmp').setup()

-- Format on save. The JavaScript formatters only run in a project that configures them.
require('conform').setup({
  formatters_by_ft = {
    elixir = { 'mix' },
    heex = { 'mix' },
    go = { 'gofmt' },
    python = { 'ruff_format' },
    rust = { 'rustfmt' },
    javascript = { 'biome', 'prettier', stop_after_first = true },
    javascriptreact = { 'biome', 'prettier', stop_after_first = true },
    typescript = { 'biome', 'prettier', stop_after_first = true },
    typescriptreact = { 'biome', 'prettier', stop_after_first = true },
  },
  formatters = {
    biome = { require_cwd = true },
    prettier = { require_cwd = true },
  },
  -- quiet: no message on each save when a file type has no formatter available.
  format_on_save = { timeout_ms = 2000, lsp_format = 'never', quiet = true },
})
