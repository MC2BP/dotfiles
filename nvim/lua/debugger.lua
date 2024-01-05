function setupDebugAdapters()
	local dap = require('dap')
	-- Golang
	dap.adapters.delve = {
		type = 'server',
		port = '${port}',
		executable = {
			command = 'dlv',
			args = {'dap', '-l', '127.0.0.1:${port}'},
		},
	}
	dap.configurations.go = {
		{
			type = "delve",
			name = "Debug Module",
			request = "launch",
			program = "${workspaceFolder}"
		},
		{
			type = "delve",
			name = "Debug test", -- configuration for debugging test files
			request = "launch",
			mode = "test",
			program = "${file}"
		},
		-- works with go.mod packages and sub packages 
		{
			type = "delve",
			name = "Debug test (go.mod)",
			request = "launch",
			mode = "test",
			program = "./${relativeFileDirname}"
		} ,
	}

	-- Rust + CPP
	dap.adapters.lldb = {
		type = 'executable',
		command = '/usr/bin/lldb-vscode', -- adjust as needed
		name = "lldb"
	}
	dap.configurations.rust = {
		{
		name = "Debug",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
			end,
			cwd = '${workspaceFolder}',
			stopOnEntry = false,
			args = {},
		},
	}
	dap.configurations.cpp = dap.configurations.rust
	dap.configurations.c = dap.configurations.rust
	dap.defaults.fallback.force_external_terminal = true
end

function setupDAPKeybindings() 
	local keymap = vim.keymap
	local opts = { 
		noremap = true, 
		silent = true
	}
	local dap = require("dap")
	keymap.set("n", "<F1>", function() dap.terminate() end, opts)
	keymap.set("n", "<F5>", function() dap.continue() end, opts)
	keymap.set("n", "<F6>", function() dap.step_over() end, opts)
	keymap.set("n", "<F7>", function() dap.step_into() end, opts)
	keymap.set("n", "<F8>", function() dap.step_out() end, opts)
	keymap.set("n", "<F9>", function() dap.toggle_breakpoint() end, opts)
	keymap.set("n", "<F10>", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, opts)
end

function dapUISetup() 
	require("dapui").setup({
	  icons = { expanded = "▾", collapsed = "▸" },
	  mappings = {
		 -- Use a table to apply multiple mappings
		 expand = { "<CR>", "<2-LeftMouse>" },
		 open = "o",
		 remove = "d",
		 edit = "e",
		 repl = "r",
	  },
	  layouts = {
		 {
			elements = {
			  { id = "scopes", size = 0.5 },
			  { id = "watches", size = 0.25 },
			  { id = "breakpoints", size = 0.25 },
			},
			size = 40,
			position = "left",
		 },
		 {
			elements = {
			  "repl",
			  "console",
			},
			  size = 10,
			  position = "bottom",
		 }
	  },
	  floating = {
		 max_height = nil, -- These can be integers or a float between 0 and 1.
		 max_width = nil, -- Floats will be treated as percentage of your screen.
		 border = "single", -- Border style. Can be "single", "double" or "rounded"
		 mappings = {
			close = { "q", "<Esc>" },
		 },
	  },
	  windows = { indent = 1 },
	  render = {
		 max_type_length = nil, -- Can be integer or nil.
	  }
	})

	local dap, dapui = require('dap'), require('dapui')
	dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
	dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
	dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end
	vim.fn.sign_define('DapBreakpoint', {text='⊖'})

	local keymap = vim.keymap
	local opts = { 
		noremap = true, 
		silent = true
	}
	keymap.set("n", "<F4>", function() dapui.toggle() end, opts)
end

return {
	"mfussenegger/nvim-dap", tag = "0.6.0",
	dependencies = {
		"rcarriga/nvim-dap-ui", tag = "v3.9.1",
		config = dapUISetup
	},
	config = function() 
		setupDebugAdapters()
		setupDAPKeybindings()
	end,
}

