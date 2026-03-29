return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile", "VeryLazy" },
  
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
  
  config = function(_, opts)
    local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return
    end

    treesitter_configs.setup(opts)

    vim.opt.conceallevel = 2
    vim.opt.concealcursor = "nc"
  end,
}
