return {
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
    config = function()
      require("bufferline").setup({
        options = {
          numbers = "ordinal",
          always_show_bufferline = true,
          separator_style = "thin",
          show_buffer_close_icons = true,
          show_close_icon = true,
          diagnostics = "nvim_lsp",       -- affiche les erreurs/warnings de LSP
          diagnostics_update_in_insert = false,
        }
      })

      -- Navigation entre buffers (tabs)
      vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
      vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
      vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")  -- fermer buffer actif
    end
  }
}
