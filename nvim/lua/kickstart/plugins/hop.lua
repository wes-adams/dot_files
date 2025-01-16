return {
	{
		"smoka7/hop.nvim",
		version = "*",
		opts = {},
		config = function()
			require("hop").setup({})
			local hop = require("hop")
			vim.keymap.set({"n", "v"}, "<leader>hw", function()
				hop.hint_words({})
			end, { desc = "[H]op [W]ord", remap = true })
			vim.keymap.set({"n", "v"}, "<leader>hl", function()
				hop.hint_lines({})
			end, { desc = "[H]op [L]ine", remap = true })
		end,
	},
}

-- vim: ts=4 sts=4 sw=4 et
