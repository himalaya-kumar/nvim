local lsp = require('lsp-zero')

lsp.preset('recommended')


lsp.setup_nvim_cmp({
  completion = {autocomplete = false}
})

lsp.setup()
