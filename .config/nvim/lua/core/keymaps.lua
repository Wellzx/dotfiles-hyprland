local M = {}

M.setup = function()
    -- opções padrão
    local opts = { noremap = true, silent = true }

    -- encurtamento
    local map = vim.api.nvim_set_keymap
    local keymap = vim.keymap.set

    -- Leader key
    vim.g.mapleader = " "

    -- =====================
    -- 📂 NvimTree
    -- =====================
    map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

    -- =====================
    -- 🔭 Telescope
    -- =====================
    local builtin = require("telescope.builtin")

    keymap("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
    keymap("n", "<leader>fg", builtin.live_grep, { desc = "Telescope Live Grep" })
    keymap("n", "<leader>fb", builtin.buffers, { desc = "Telescope Buffers" })
    keymap("n", "<leader>fh", builtin.help_tags, { desc = "Telescope Help Tags" })

    -- =====================
    -- 🪟 Navegação entre splits
    -- =====================
    map("n", "<C-h>", "<C-w>h", opts)
    map("n", "<C-j>", "<C-w>j", opts)
    map("n", "<C-k>", "<C-w>k", opts)
    map("n", "<C-l>", "<C-w>l", opts)

    -- =====================
    -- 💾 Salvar / ❌ Sair
    -- =====================
    map("n", "<leader>w", ":w<CR>", opts)
    map("n", "<leader>q", ":q<CR>", opts)
end

return M