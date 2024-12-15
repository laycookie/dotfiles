local module_export = {}

-- Vim
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "jj", "<ESC>")
-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
-- undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
-- Cloak
vim.keymap.set('n', '<leader>ct', vim.cmd.CloakToggle)
-- LSP zero
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

module_export.lsp_attach = function(client, bufnr)
  local opts = {buffer = bufnr}

  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end



local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_select = {behavior = cmp.SelectBehavior}
module_export.cmp_mapping = cmp.mapping.preset.insert({
	['<C-Space>'] = cmp.mapping.complete(),
	-- Confirmation
	['<CR>'] = cmp.mapping.confirm({ select = false }), -- Enter
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-e>'] = cmp.mapping.abort(),
	-- Movement
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
	['<Down>'] = cmp.mapping.select_next_item(cmp_select),
	-- Luasnip Movement
	['<Tab>'] = cmp_action.tab_complete(),
})


vim.keymap.set('n', '<leader>h', function()
	local current_setting = vim.lsp.inlay_hint.is_enabled()
        vim.lsp.inlay_hint.enable(not current_setting)
end)
-- Rustaceanvim
vim.keymap.set('n', '<leader>ce', function() 
	vim.cmd.RustLsp('explainError')
end)
vim.keymap.set('n', '<leader>d', function() 
	vim.cmd.RustLsp('renderDiagnostic')
end)
vim.keymap.set('n', '<leader>ca', function()
	vim.cmd.RustLsp('codeAction')
end)
vim.keymap.set('n', '<leader>cd', function()
	vim.cmd.RustLsp('openDocs')
end)
-- DAP (Debug Adapter Protocol)
vim.keymap.set('n', '<leader>br', vim.cmd.DapToggleBreakpoint)
vim.keymap.set('n', '<leader>bs', vim.cmd.DapStepOver)
-- harpoon
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
for i=1,9 do
	vim.keymap.set("n", "<leader>" .. tostring(i), function() harpoon:list():select(i) end)
end

-- EXPORT FOR EXTERNAL FILES
return module_export
