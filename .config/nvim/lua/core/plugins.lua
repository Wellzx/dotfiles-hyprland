local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- Auto-install packer se não existir
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Declaração dos plugins
local packer = require('packer')
local use = packer.use

-- Auto-sync de plugins na primeira instalação
packer.startup(function()
    -- Gerenciador
    use "wbthomason/packer.nvim"

    -- Plenary (dependência obrigatória de Telescope)
    use "nvim-lua/plenary.nvim"

    -- Telescope (fuzzy finder)
    use {
       'nvim-telescope/telescope.nvim',
       requires = { 'nvim-lua/plenary.nvim' }
    }

    -- NvimTree (explorador de arquivos)
    use "nvim-tree/nvim-tree.lua"
    use "nvim-tree/nvim-web-devicons"  -- ícones

    -- LSP e Mason
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"

    -- Autocomplete
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"

    -- Dashboard inicial (Alpha)
    use {
        "goolord/alpha-nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
    }
end)

-- Se packer acabou de ser instalado, força sync
if packer.needs_sync then
    packer.sync()
end