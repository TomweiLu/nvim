return {
  {
    'echasnovski/mini.nvim',
    event = 'VeryLazy',
    config = function()
      require('mini.ai').setup()
      require('mini.move').setup()     -- <A-h/j/k/l>
      require('mini.pairs').setup()
      require('mini.surround').setup() -- saiw) sd] sr'" sf{ sh'
    end
  }
}
