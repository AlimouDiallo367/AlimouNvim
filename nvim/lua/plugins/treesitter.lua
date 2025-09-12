return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,
        build = ":TSUpdate",
        config = function()
          require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "javascript", "typescript", "ruby", "rust", "cpp", "c_sharp" },
            highlight = { enable = true },
            indent = { enable = true },
          })
        end,
    },
}

