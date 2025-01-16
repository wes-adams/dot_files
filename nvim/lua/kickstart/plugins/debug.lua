-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
	-- NOTE: Yes, you can install new plugins here!
	"mfussenegger/nvim-dap",
	-- NOTE: And you can specify dependencies as well
	dependencies = {
		-- Creates a beautiful debugger UI
		"rcarriga/nvim-dap-ui",

		-- Installs the debug adapters for you
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",

		-- Add your own debuggers here
		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_setup = true,

			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			handlers = {},

			-- You'll need to check that you have the required things installed
			-- online, please don't ask me how to install them :)
			ensure_installed = {
				-- Update this to ensure that you have the debuggers for the langs you want
				"delve",
			},
		})

		dap.adapters.cppdbg = {
			id = "cppdbg",
			type = "executable",
			command = "/home/test/Downloads/extension/debugAdapters/bin/OpenDebugAD7",
		}

		dap.configurations.cpp = {
			{
				name = "gdbserver localhost:6666 :: PC linux",
				type = "cppdbg",
				request = "launch",
				MIMode = "gdb",
				miDebuggerServerAddress = "localhost:6666",
				miDebuggerPath = "/usr/bin/gdb",
				cwd = "${workspaceFolder}",
				program = function()
					-- return "/home/test/Repositories/profire/SFW/linux/native/build/linux_sfw"
					return "/home/test/Repositories/linux_osal/native/build/linux_sfw"
					-- return "/home/test/Repositories/profire/SFW/linux/native/build/linux_sfw"
				end,
			},
			{
				name = "gdbserver localhost:6666 :: embedded linux 32-bit :: 192.168.0.126",
				type = "cppdbg",
				request = "launch",
				MIMode = "gdb",
				miDebuggerServerAddress = "192.168.0.126:6666",
				miDebuggerPath = "/opt/poky-atmel/4.0.12/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-gdb",
				cwd = "${workspaceFolder}",
				program = function()
					-- return "/home/test/Repositories/profire/SFW/linux/ARM_cortex-a53/build/linux_sfw"
					return "/home/test/Repositories/linux_osal/ARM_cortex-a53/build/linux_sfw"
				end,
			},
			{
				name = "gdbserver localhost:6666 :: embedded linux 32-bit :: 192.168.1.126",
				type = "cppdbg",
				request = "launch",
				MIMode = "gdb",
				miDebuggerServerAddress = "192.168.1.126:6666",
				miDebuggerPath = "/opt/poky-atmel/4.0.12/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-gdb",
				cwd = "${workspaceFolder}",
				program = function()
					-- return "/home/test/Repositories/profire/SFW/linux/ARM_cortex-a53/build/linux_sfw"
					return "/home/test/Repositories/linux_osal/ARM_cortex-a53/build/linux_sfw"
				end,
			},
			{
				name = "gdbserver localhost:6666 :: embedded linux 32-bit :: 10.11.19.72",
				type = "cppdbg",
				request = "launch",
				MIMode = "gdb",
				miDebuggerServerAddress = "10.11.19.72:6666",
				miDebuggerPath = "/opt/poky-atmel/4.0.12/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-gdb",
				cwd = "${workspaceFolder}",
				program = function()
					-- return "/home/test/Repositories/profire/SFW/linux/ARM_cortex-a53/build/linux_sfw"
					return "/home/test/Repositories/linux_osal/ARM_cortex-a53/build/linux_sfw"
				end,
			},
			{
				name = "gdbserver localhost:6666 :: embedded linux 64-bit :: 192.168.0.126",
				type = "cppdbg",
				request = "launch",
				MIMode = "gdb",
				miDebuggerServerAddress = "192.168.0.126:6666",
				-- miDebuggerPath = "/opt/poky-atmel/4.0.12/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-gdb",
				miDebuggerPath = "/opt/ampliphy-xwayland/BSP-Yocto-Ampliphy-AM62x-PD23.2.1/sysroots/x86_64-phytecsdk-linux/usr/bin/aarch64-phytec-linux/aarch64-phytec-linux-gdb",
				cwd = "${workspaceFolder}",
				program = function()
					-- return "/home/test/Repositories/profire/SFW/linux/ARM_cortex-a53/build/linux_sfw"
					return "/home/test/Repositories/linux_osal/ARM_cortex-a53/build/linux_sfw"
				end,
			},
			{
				name = "gdbserver localhost:6666 :: embedded linux 64-bit :: 192.168.1.126",
				type = "cppdbg",
				request = "launch",
				MIMode = "gdb",
				miDebuggerServerAddress = "192.168.1.126:6666",
				-- miDebuggerPath = "/opt/poky-atmel/4.0.12/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-gdb",
				miDebuggerPath = "/opt/ampliphy-xwayland/BSP-Yocto-Ampliphy-AM62x-PD23.2.1/sysroots/x86_64-phytecsdk-linux/usr/bin/aarch64-phytec-linux/aarch64-phytec-linux-gdb",
				cwd = "${workspaceFolder}",
				program = function()
					-- return "/home/test/Repositories/profire/SFW/linux/ARM_cortex-a53/build/linux_sfw"
					return "/home/test/Repositories/linux_osal/ARM_cortex-a53/build/linux_sfw"
				end,
			},
		}

		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp

		-- Basic debugging keymaps, feel free to change to your liking!
		vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
		vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
		vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
		vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Set Breakpoint" })

		-- Dap UI setup
		-- For more information, see |:help nvim-dap-ui|
		dapui.setup({
			-- Set icons to characters that are more likely to work in every terminal.
			--    Feel free to remove or use ones that you like more! :)
			--    Don't feel like these are good choices.
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
		})

		-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
		vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		-- Install golang specific config
		require("dap-go").setup()
		vim.keymap.set("n", "<leader>ddO", require("dapui").open, { desc = "[dd]AP [O]pen" })
		vim.keymap.set("n", "<leader>ddC", require("dapui").close, { desc = "[dd]AP [C]lose" })
		vim.keymap.set("n", "<leader>ddb", require("dap").close, { desc = "[dd]ebug toggle [b]reakpoint" })
		vim.keymap.set("n", "<leader>ddc", require("dap").close, { desc = "[dd]ebug [c]ontinue" })

		vim.keymap.set("n", "<leader>ddc", function()
			require("dap").continue()
		end, { desc = "[dd]ebug [c]ontinue" })
		vim.keymap.set("n", "<leader>ddss", function()
			require("dap").step_over()
		end, { desc = "[dd]ebug [ss]step_over" })
		vim.keymap.set("n", "<leader>ddsi", function()
			require("dap").step_into()
		end, { desc = "[dd]ebug [s]tep [i]nto" })
		vim.keymap.set("n", "<leader>ddso", function()
			require("dap").step_out()
		end, { desc = "[dd]ebug [s]tep [o]ut" })
		vim.keymap.set("n", "<Leader>ddb", function()
			require("dap").toggle_breakpoint()
		end, { desc = "[dd]ebug toggle [b]reakpoint" })

		vim.keymap.set({ "n", "v" }, "<Leader>ddh", function()
			require("dap.ui.widgets").hover()
		end, { desc = "[dd]ebug [h]over" })
		vim.keymap.set({ "n", "v" }, "<Leader>ddp", function()
			require("dap.ui.widgets").preview()
		end, { desc = "[dd]ebug [p]review" })
		vim.keymap.set("n", "<Leader>ddf", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.frames)
		end, { desc = "[dd]ebug [f]rames" })
		vim.keymap.set("n", "<Leader>ddS", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end, { desc = "[dd]ebug [S]copes" })

		require("dapui").setup()
	end,
}
