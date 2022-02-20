lua <<EOF
local cmp = require'cmp'
cmp.setup({
 snippet = {
	-- REQUIRED - you must specify a snippet engine
	expand = function(args)
	  vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
	  -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	  -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
	  -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
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
	{ name = 'path' },
	{ name = 'dictionary' },
	-- { name = 'vsnip' }, -- For vsnip users.
	-- { name = 'luasnip' }, -- For luasnip users.
	-- { name = 'ultisnips' }, -- For ultisnips users.
	-- { name = 'snippy' }, -- For snippy users.
 }, {
	{ name = 'buffer' },
 })
})

require("cmp_dictionary").setup({
    dic = {
        --["*"] = "/usr/share/dict/en",
        --["*"] = "/usr/share/dict/word",
    },
    -- The following are default values, so you don't need to write them if you don't want to change them
    exact = 2,
    async = false, 
    capacity = 5,
    debug = false, 
})

-- ------------------------
-- Language Server Protocol
-- ------------------------
local nvim_lsp = require('lspconfig')

-- only set keybindings of language server is running
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- autocompletion
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = { 'rust_analyzer', 'gopls', 'texlab', 'ccls' }
for _, lsp in ipairs(servers) do
  capabilities = capabilities
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF
