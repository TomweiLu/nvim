return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        "nvim-dap-ui",
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
