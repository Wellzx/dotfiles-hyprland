local M = {}

M.setup = function()
    local ok, nvim_tree = pcall(require, "nvim-tree")
    if not ok then
        return
    end

    nvim_tree.setup({
        disable_netrw = true,
        hijack_netrw = true,
        update_cwd = true,

        view = {
            width = 30,
            side = "left",
            number = true,
            relativenumber = false,
        },

        renderer = {
            icons = {
                show = {
                    file = true,
                    folder = true,
                    git = true,
                },
            },
        },

        git = {
            enable = true,
            ignore = false,
        },

        actions = {
            open_file = {
                quit_on_open = false,
                resize_window = true,
            },
        },

        -- Configuração de keymaps dentro do nvim-tree
        on_attach = function(bufnr)
            local api = require("nvim-tree.api")

            local opts = function(desc)
                return {
                    desc = desc,
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                    nowait = true
                }
            end

            -- Navegação básica
            vim.keymap.set("n", "h", api.node.close, opts("Close Node"))
            vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
            vim.keymap.set("n", "v", api.node.open.vertical, opts("Open Vertical Split"))

            -- 🔥 Substitui o 'f' padrão do nvim-tree (Filter)
            -- pelo Telescope (Find Files)
            vim.keymap.set("n", "f", function()
                require("telescope.builtin").find_files()
            end, opts("Find Files"))
        end,
    })
end

return M