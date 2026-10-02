-- Language servers. nvim-lspconfig supplies each server's configuration, and Neovim's defaults
-- supply the keys: K hover, grn rename, gra code action, grr references, gri implementation,
-- ]d and [d next and previous diagnostic.

-- Server name and the executable it needs. A server whose executable is not installed on this
-- host is left out, so the same config works on every machine.
local servers = {
  basedpyright = 'basedpyright-langserver',
  expert = 'expert',
  gopls = 'gopls',
  lua_ls = 'lua-language-server',
  ruff = 'ruff',
  rust_analyzer = 'rust-analyzer',
  sourcekit = 'sourcekit-lsp',
  vtsls = 'vtsls',
}

for server, executable in pairs(servers) do
  if vim.fn.executable(executable) == 1 then
    vim.lsp.enable(server)
  end
end

vim.diagnostic.config({ virtual_text = true })

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
