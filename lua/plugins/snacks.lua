return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = { enabled = true },
      explorer = {
        enabled = true,
        replace_netrw = true
      },
      indent = { enabled = true },
      input = { enabled = true },
      lazygit = { enabled = true },
      notifier = { enabled = true },
      notify = { enabled = true },
      picker = { enabled = true },
      rename = { enabled = true },
      scratch = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
    },
    keys = {
      -- explorer
      { "<leader>e",       function() Snacks.explorer() end,              desc = "Explorer" },
      -- notifier
      { "<leader>n",       function() Snacks.notifier.show_history() end, desc = "Notification History" },
      -- picker
      { "<leader><space>", function() Snacks.picker.smart() end,          desc = "Find File" },
      { "<leader>/",       function() Snacks.picker.grep() end,           desc = "Grep" },
      -- git
      { "<leader>gg",      function() Snacks.lazygit() end,               desc = "Lazygit" },
      { "<leader>gb",      function() Snacks.picker.git_branches() end,   desc = "Git Branches" },
      { "<leader>gl",      function() Snacks.picker.git_log() end,        desc = "Git Log" },
      { "<leader>gs",      function() Snacks.picker.git_status() end,     desc = "Git Status" },
      { "<leader>gd",      function() Snacks.picker.git_diff() end,       desc = "Git Diff" },
      -- search
      { "<leader>sb",      function() Snacks.picker.grep_buffers() end,   desc = "Grep Buffers" },
      { "<leader>sk",      function() Snacks.picker.keymaps() end,        desc = "Keymaps" },
      { "<leader>sm",      function() Snacks.picker.marks() end,          desc = "Marks" },
      { "<leader>sq",      function() Snacks.picker.qflist() end,         desc = "Quickfix List" },
      { "<leader>su",      function() Snacks.picker.undo() end,           desc = "Undo" },
      -- rename file
      { "<leader>R",       function() Snacks.rename.rename_file() end,    desc = "Rename File" },
      -- scratch
      { "<leader>`",       function() Snacks.scratch() end,               desc = "Scratch" },
      { "<leader>~",       function() Snacks.scratch.select() end,        desc = "Select Scratch" },
    }
  }
}
