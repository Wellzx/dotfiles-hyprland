local M = {}

M.setup = function()
  local ok, telescope = pcall(require, "telescope")
  if not ok then return end

  telescope.setup{
    defaults = {
      file_ignore_patterns = { "node_modules", ".git/" },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case"
      },
      prompt_prefix = "🔍 ",
      selection_caret = " ",
      path_display = { "smart" },
    }
  }

  -- Atalhos rápidos para telescope
  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
  map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
  map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
  map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
end

return M