require("nvchad.configs.lspconfig").defaults()

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {
  capabilities = capabilities,
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

lspconfig.elixirls.setup {
  cmd = {vim.fn.stdpath("data") .. "/mason/packages/elixir-ls/language-server.sh"},
  capabilities = capabilities,
  filetypes = {"elixir", "eelixir", "heex"},
  root_dir = lspconfig.util.root_pattern("mix.exs")
}

lspconfig.ts_ls.setup {
  capabilities = capabilities,
  on_attach = function (client, _bufnr)
    client.server_capabilities.documentFormattingProvider = false

    -- local buf_map = function (mode, lhs, rhs)
    --   vim.api.nvim_buf_set_keymap(
    --     bufnr,
    --     mode,
    --     lhs,
    --     rhs,
    --     {
    --       noremap = true,
    --       silent = true
    --     }
    --   )
    -- end
  end,
  filetypes = {"javascript", "javascriptreact"},
  root_dir = vim.loop.cwd()
}

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
