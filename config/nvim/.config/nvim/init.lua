-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
---
--- LSP CONFIGURATION
--- (see https://github.com/neovim/nvim-lspconfig#quickstart)
---
--- Python LSP
require("lspconfig").pyright.setup({})
-- Vue LSP
require("lspconfig").vuels.setup({})
-- Docker LSP
require("lspconfig").docker_compose_language_service.setup({})
-- Docker compose LSP
