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
local lsp = require('lsp-zero')
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior}
local cmp_mapping = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
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

