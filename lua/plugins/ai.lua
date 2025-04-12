return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      vim.keymap.set("i", "<S-Tab>", "<plug>(copilot-accept-line)")
      vim.keymap.set("i", "<A-Tab>", "<plug>(copilot-dismiss)")
    end
  }
}
