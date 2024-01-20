return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local lspui = require("lspconfig.ui.windows")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

-- 		-- Auto Formatting
-- 		vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

		--LspInfo Borders
		lspui.default_options.border = "double"

		-- Managing language servers individually
		-- clangd
		lspconfig.clangd.setup({
			capabilities = capabilities,
		})
	end,
}
