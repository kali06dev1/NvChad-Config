require("nvchad.configs.lspconfig").defaults()

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostic = {
        globals = { "vim" }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {enable = false}
    }
  }
}

lspconfig.html.setup {
  capabilities = capabilities,
  filetypes = {"html", "heex", "eex"}
}

lspconfig.emmet_ls.setup {
  capabilities = capabilities,
  filetypes = {
    "html",
    "heex"
  }
}

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
