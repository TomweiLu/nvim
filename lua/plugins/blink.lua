return {
  {
    'saghen/blink.cmp',
    version = '*',
    event = "VeryLazy",
    opts = {
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
      keymap = { preset = 'enter' },
      completion = { documentation = { auto_show = true } },
      cmdline = {
        keymap = { preset = 'inherit' },
        completion = { menu = { auto_show = true } }
      }
    }
  }
}
-- <C-space> = toggle documentation
-- <C-e> = hide
-- <CR> = accept
--
-- <Tab> = snippet_forward
-- <S-Tab> = snippet_backward
--
-- <Up> = select_prev
-- <Down> = select_next
-- <C-p> = select_prev
-- <C-n> = select_next
--
-- <C-b> = scroll_documentation_up
-- <C-f> = scroll_documentation_down
--
-- <C-k> = toggle signature
