return {
	{
		"simrat39/rust-tools.nvim",
		config = function()
			local rt = require("rust-tools")

			rt.setup({
				server = {
					on_attach = function(_, bufnr)
						local opts = { noremap = true, silent = true, buffer = bufnr }
						vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
						vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
						vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

						-- Rust-specific keymaps
						vim.keymap.set("n", "<leader>rr", rt.runnables.runnables, opts)
						vim.keymap.set("n", "<leader>rd", rt.debuggables.debuggables, opts)
						vim.keymap.set("n", "K", rt.hover_actions.hover_actions, opts)
						vim.keymap.set("n", "<leader>I", rt.inlay_hints.set, opts)
						vim.keymap.set("n", "<leader>i", rt.inlay_hints.unset, opts)
					end,
				},
			})
		end,
	},
}
