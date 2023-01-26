-- indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

-- row numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- swapfile stuff is annoying af
vim.opt.swapfile = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"

-- mark 80th char so I don't make too long lines                               
vim.opt.colorcolumn = "80"

--change default shell
local function determine_shell()
    -- use powershell by default
    local shell = vim.opt.shell
    local os = vim.loop.os_uname().sysname
    if os == "Windows_NT" then
        shell = "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"
        vim.opt.shellxquote = nil
        vim.opt.shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -NoProfile '
	    ..'-Command '

    elseif os == "Linux" then
        shell = "/usr/bin/bash"
    end
    return shell
end
vim.opt.shell = determine_shell()
