local M = {} 

M.setup = function()
    vim.o.termguicolors = true
    vim.cmd [[
        hi Normal guibg=NONE
        hi NormalNC guibg=NONE
        hi LineNr guibg=NONE
        hi SignColumn guibg=NONE
        hi VertSplit guibg=NONE
    ]]
end

return M