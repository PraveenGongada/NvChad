local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

--#region Golang
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
    },
  },
}
--#endregion

--#region TypeScript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}
--#endregion

--#region tailwind
lspconfig.tailwindcss.setup {}
--#endregion

--#region css
lspconfig.cssls.setup {}
--#endregion

--#region rescript
lspconfig.rescriptls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "rescript-language-server", "--stdio" },
  filetypes = { "rescript" },
  init_options = {
    extensionConfiguration = {
      askToStartBuild = false,
      inlayHints = {
        enable = true,
      },
    }
  },
  root_dir = util.root_pattern{"rescript.json"},
  settings = {}
}
--#endregion

-- #purescript
-- lspconfig.purescriptls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = { "purescript-language-server", "--stdio" },
--   filetypes = {"purescript"},
--   root_dir = util.root_pattern{ "spago.dhall" },
--   settings = {
--     purescript = {
--       addSpagoSources = true -- e.g. any purescript language-server config here
--     }
--   },
--   flags = {
--     debounce_text_changes = 150,
--   }
-- }
