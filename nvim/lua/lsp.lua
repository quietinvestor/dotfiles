-- lsp.lua

-- Use LSP as the handler for omnifunc for autocompletion.
-- vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

--- clangd C LSP
require'lspconfig'.clangd.setup{}

-- pyright Python LSP
require'lspconfig'.pyright.setup{}

-- lua_ls LSP
require'lspconfig'.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}

-- bashls Bash LSP
require'lspconfig'.bashls.setup{}

-- dockerls Docker LSP
require'lspconfig'.dockerls.setup{}

-- jsonls JSON LSP

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.jsonls.setup {
  capabilities = capabilities,
}

-- yamlls YAML LSP
require('lspconfig').yamlls.setup {
  -- other configuration for setup {}
  settings = {
    yaml = {
      -- other settings. note this overrides the lspconfig defaults.
      schemas = {
        -- ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
        -- other schemas
      },
    },
  }
}

-- vimls vim LSP
require'lspconfig'.vimls.setup{}

-- ltex LTeX LSP, including support for markdown and others
require'lspconfig'.ltex.setup{}
