return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-path" },
		{ 
			"hrsh7th/nvim-cmp",
			config = function()
				local cmp = require'cmp'
				cmp.setup({
					snippet = {
						expand = function(args)
							vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						end,
					},
					mapping = {
						['<tab>'] = cmp.mapping.select_next_item(),
						['<S-tab>'] = cmp.mapping.select_prev_item(),
						['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
						['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
						['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
						['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
						['<C-e>'] = cmp.mapping({
						  i = cmp.mapping.abort(),
						  c = cmp.mapping.close(),
						}),
						['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					},
					sources = cmp.config.sources({
						{ name = 'nvim_lsp' },
						-- { name = 'path' },
					}, {
						{ name = 'buffer' },
					})
				})
			end,
		},
	},
	config = function()
		local nvim_lsp = require('lspconfig')
		-- only set keybindings of language server is running
		local on_attach = function(client, bufnr)
		local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
		local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

		-- Enable completion triggered by <c-x><c-o>
		buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

		-- Mappings.
		local bufopts = { noremap=true, silent=true, buffer=bufnr }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

		vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, bufopts)

		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set('n', 'rn', vim.lsp.buf.rename, bufopts)

		vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, bufopts)
		vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts) end
		-- show lsp diagnostics in hover window 
		vim.o.updatetime = 250
		vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
		-- autocompletion
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		local servers = { 
			'wgsl_analyzer', 
			'rust_analyzer', 
			'ccls',
			'hls',
			'gopls', 
			'typst_lsp',
			'texlab', 
			'angularls', 
			'html', 
			'cssls', 
			'tsserver', 
			'jsonls', 
			'pyright'
		}
		for _, lsp in ipairs(servers) do
			capabilities = capabilities
			nvim_lsp[lsp].setup {
				on_attach = on_attach,
				flags = { debounce_text_changes = 150 }
			}
		end

		-- typst
		local util = require 'lspconfig.util'
		nvim_lsp.typst_lsp.setup{
			settings = {
				exportPdf = "onType"
			}
		}
	end,
}
