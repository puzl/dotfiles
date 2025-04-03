local lsp_zero = require('lsp-zero')
require('lspconfig').intelephense.setup({})
require('lspconfig').ccls.setup({})

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require('lspconfig').ruff.setup({
    init_options = {
        settings = {
            -- Ruff language server settings go here
        }
    }
})
