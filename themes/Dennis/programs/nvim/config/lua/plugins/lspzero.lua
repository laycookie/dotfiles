return {
  'VonHeikemen/lsp-zero.nvim',
  lazy = false,
  dependencies = {
    -- LSP Support
    {'williamboman/mason.nvim'},           
    {'williamboman/mason-lspconfig.nvim'}, 
    {'neovim/nvim-lspconfig'},             -- Required

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},       
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},      
    {'hrsh7th/cmp-path'},         
    {'saadparwaiz1/cmp_luasnip'}, 
    {'hrsh7th/cmp-nvim-lua'},     

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'},

    -- lspkind
    {'onsails/lspkind.nvim'},
  },
  config = function()
      local lsp = require('lsp-zero')

      lsp.preset('recommended')

      lsp.ensure_installed({
	'tsserver',
	'eslint',
	'lua_ls',
	'pylsp',
      })

      lsp.format_on_save({
	servers = {
		["rust-analyzer"] = {"rust"}
	}
      })

      lsp.setup()
  end
}
