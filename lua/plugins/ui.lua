return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_mode = false,
    },
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = {
      { "<leader>bc", ":bdelete<cr>",                   desc = "Delete buffer" },
      { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
      { "[b",         "<cmd>BufferLineCyclePrev<cr>",   desc = "Prev Buffer" },
      { "]b",         "<cmd>BufferLineCycleNext<cr>",   desc = "Next Buffer" },
      { "[B",         "<cmd>BufferLineMovePrev<cr>",    desc = "Move buffer prev" },
      { "]B",         "<cmd>BufferLineMoveNext<cr>",    desc = "Move buffer next" },
    },
    event = 'VeryLazy',
    opts = {
      options = {
        offsets = { { filetype = 'snacks_layout_box' } },
      }
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    opts = {
      options = {
        theme = 'dracula',
        component_separators = '',
        section_separators = '',
        disabled_filetypes = { 'snacks_dashboard' },
        globalstatus = true
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'lsp_status' },
        lualine_c = { 'diagnostics' },
        lualine_x = { 'diff' },
        lualine_y = { 'branch' },
        lualine_z = { 'location' },
      },
      extensions = { 'nvim-dap-ui', 'quickfix' }
    },
  }
}
