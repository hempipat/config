-- local status_ok, _ = pcall(require, "lspconfig")
-- if not status_ok then
--   return
-- end
local lspconfig = vim.F.npcall(require, "lspconfig")
if not lspconfig then
  return
end

local ts_util = require "nvim-lsp-ts-utils"

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local custom_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()

local servers = {
    angularls = true,
    -- html = true,
    -- angularls = {
    --     cmd = { "angular-language-server", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" },
    --     filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" }
    -- },
    tsserver = {
        init_options = ts_util.init_options,
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
        on_attach = function (client)
            custom_attach(client)

            ts_util.setup { auto_inlay_hints = false }
            ts_util.setup_client(client)
        end,
        -- on_attach = function(client)
        --   custom_attach(client)
        --
        --   ts_util.setup { auto_inlay_hints = false }
        --   ts_util.setup_client(client)
        -- end,
    },
}


require("mason").setup()

require("lspconfig").sumneko_lua.setup {
  on_attach = custom_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          -- vim
	  "vim",
	},
      },
    },
  },
}


-- require("lspconfig").angularls.setup {
-- }
require("mason-lspconfig").setup {
  -- ensure_installed = { "angularls" }
    -- ensure_installed = { "sumneko_lua" },
}


local setup_server = function(servers, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    flags = {
      debounce_text_changes = nil,
    },
  }, config)

  lspconfig[servers].setup(config)
end

for server, config in pairs(servers) do
    setup_server(server, config)
end

return {
  on_attach = custom_attach
}


