return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("y.lsp")
    end,
  },
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "mfussenegger/nvim-jdtls",
  "simrat39/inlay-hints.nvim",
  "j-hui/fidget.nvim",
  "folke/neodev.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  "jose-elias-alvarez/nvim-lsp-ts-utils",
  "nvim-lua/lsp-status.nvim"
}
