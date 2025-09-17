return {
  {
    "rafamadriz/friendly-snippets",
    dependencies = { "L3MON4D3/LuaSnip" },
    config = function()
      -- Charger automatiquement tous les snippets VSCode (dont JS, TS, React…)
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
