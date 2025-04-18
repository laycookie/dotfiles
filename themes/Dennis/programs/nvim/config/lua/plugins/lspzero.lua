return {
  'VonHeikemen/lsp-zero.nvim',
  lazy = false,
  dependencies = {
    -- LSP Support
    {
    	'williamboman/mason.nvim',
	opts = {
		ensure_installed = { 'prettierd' } -- Might possibly not be working
	},
    },           
    {'williamboman/mason-lspconfig.nvim'}, 
    {
    	'neovim/nvim-lspconfig',
	-- commit = "36f21ab9555d"
    },

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {
	'L3MON4D3/LuaSnip',
	build = "make install_jsregexp",
    },
    {'hrsh7th/cmp-nvim-lua'},
    {
    	'windwp/nvim-ts-autotag', 
    	ft = {"html", "javascript", "javascriptreact", "typescript", "typescriptreact", "astro"},
	config = function()
		require("nvim-ts-autotag").setup()
	end
    },
    -- Formater
    {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	opts = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")

		local opts = { 
			sources = {
				null_ls.builtins.formatting.prettierd,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		}

		return opts
	end,
    },

    -- Snippets
    {
	'L3MON4D3/LuaSnip',
	dependencies = { 'rafamadriz/friendly-snippets' }
    },

    -- lspkind
    {'onsails/lspkind.nvim'},
  },
  config = function()
	local lsp = require('lsp-zero')
	local keymap = require('core.keymap')

	vim.diagnostic.config({
		virtual_text = true,
		float = {
			style = '',
			source = 'always',
		},
	})

      lsp.extend_lspconfig({
	sign_text = true,
	lsp_attach = keymap.lsp_attach,
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      lsp.on_attach(function(client, bufnr)
		lsp.default_keymaps({
			buffer = bufnr,
			preserve_mappings = false,
		})
      end)

	local cmp = require('cmp')
	local cmp_format = require('lsp-zero').cmp_format({details = true})
	require('luasnip.loaders.from_vscode').lazy_load()
	cmp.setup({
		sources = {
			{name = 'nvim_lsp'},
			{name = 'buffer'},
			{name = 'luasnip'}
		},
		formatting = cmp_format,
		mapping = keymap.cmp_mapping,
		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body)
			end,
		},
	})

	vim.filetype.add({
		extension = {
			slint = 'slint',
		}
	})

      require('mason').setup({})
      require('mason-lspconfig').setup({
		ensure_installed = {
			'lua_ls',
			'pylsp',
			'lemminx', -- XML
			'slint_lsp',
			'wgsl_analyzer',
			'eslint',
			'denols', -- TypeScript
			'tailwindcss',
			'prismals',
			'jsonls',
			'html',
			'astro',
			'cssls',
			'graphql',
			'harper_ls', -- English Grammer
			'nil_ls', -- nix
		},
		handlers = {
			function(server_name)
				require('lspconfig')[server_name].setup({})
			end,
		},
      })
      require("lspconfig").clangd.setup({}) -- Prevents Mason from installing its own clang

      lsp.format_on_save({
	servers = {
		["rust-analyzer"] = {"rust"},
	},
      })

      lsp.setup()
  end
}
