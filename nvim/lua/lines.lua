local api = vim.api

------------------------------------------------------------------------------------------
--Functions
------------------------------------------------------------------------------------------
vim.o.showtabline = 2

local function tabs()
	line = ""

	pages = api.nvim_list_tabpages()
	current = api.nvim_get_current_tabpage()
	for i = 1,#(pages),1 do
		page = ""
		if (current == i) then
			page = string.format("%%#TablineSel# %d", i)
		else
			page = string.format("%%#Tabline# %d", i)
		end
		line = line .. page
	end

	return line
end

local function filesOfCurrentTab()
	line = " "
	wins = api.nvim_tabpage_list_wins(api.nvim_get_current_tabpage())
	currbuf = api.nvim_get_current_buf()

	files = {}

	for i = 1,#(wins),1 do
		buf = api.nvim_win_get_buf(wins[i])
		filename = api.nvim_buf_get_name(buf)
		if (#filename > 0) then
			-- trim path from filename
			start, finish = string.find(filename,"(.*/)")
			filename = string.sub(filename, finish+1, #filename)

			-- highlight current buffer
			if (buf ~= currbuf) then
				files[buf] = string.format("%%#Tabline#%s ", filename)
			else
				files[buf] = string.format("%%#TablineSel#%s ", filename)
			end
		end 
	end
	if (#files > 0) then
		for _, file in pairs(files) do 
			line = line .. file .. " "
		end
	end
	return line
end

local function lsp()
	local count = {}
	local levels = {
		errors = "Error",
		warnings = "Warn",
		info = "Info",
		hints = "Hint",
	}
	
	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end
	
	local errors = ""
	local warnings = ""
	local hints = ""
	local info = ""
	
	errors = "%#LspDiagnosticsSignError# " .. count["errors"]
	warnings = " %#LspDiagnosticsSignWarning# " .. count["warnings"]
	hints = " %#LspDiagnosticsSignHint# " .. count["hints"]
	info = " %#LspDiagnosticsSignInformation# " .. count["info"]
	
	return "%#StatusLine# " .. errors .. warnings .. hints .. info .. " %#StatusLine#"
end


------------------------------------------------------------------------------------------
--StatusLine
------------------------------------------------------------------------------------------
vim.opt.laststatus = 3
vim.o.fillchars = vim.o.fillchars .. "stlnc: ,stl: "
local fn = vim.fn

local function filetype()
    return string.format(" %s ", vim.bo.filetype):upper()
end

Statusline = {}
Statusline.active = function()
    return table.concat {
        recording(),
        "%#VertSplit#<",
        "%#StatusLine# %f",
        " %#VertSplit#>",
        "%=<",
        lsp(),
        "%#StatusLine# %%%p %l:%c",
        filetype(),
        " %#VertSplit#>",
    }
end

function recording()
    r = vim.fn.reg_recording()
    if r == "" then
        return ""
    end
    return "Recording: %{reg_recording()} "
end

function Statusline.inactive()
    return "%#VertSplit#-<%#Tabline# %{WebDevIconsGetFileTypeSymbol()} %F %#VertSplit#>-"
end

api.nvim_exec([[
    augroup Statusline
    au!
    au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
    au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
    augroup END
]], false)

------------------------------------------------------------------------------------------
--Tabline
------------------------------------------------------------------------------------------
Tabline = function()
	return table.concat {
		tabs(),
		"%=",
		filesOfCurrentTab(),
		"%=",
		-- "  %{FugitiveStatusline()} ",
	}
end

api.nvim_exec([[
	set tabline=%!v:lua.Tabline()
]], false)

