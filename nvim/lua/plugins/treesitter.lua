return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  -- Lade das Plugin intelligent, sobald eine Datei gelesen oder neu erstellt wird
  event = { "BufReadPost", "BufNewFile" },
  
  -- Hier kommen NUR die reinen Einstellungen rein (Lazy reicht diese automatisch weiter)
  opts = {
    auto_install = true,
    ensure_installed = {
      "lua", "javascript", "c", "cpp", "vim", "vimdoc",
      "html", "css", "python", "bash",
      "markdown", "markdown_inline"
    },
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = { enable = true },
  },
  
  -- Die config-Funktion nimmt jetzt die opts von oben entgegen
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    -- Deine globalen Neovim-Optionen
    vim.opt.conceallevel = 2
    vim.opt.concealcursor = "nc"
  end,
}
