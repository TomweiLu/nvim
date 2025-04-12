-- Basic
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>q!<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>x", "<cmd>x<cr>", { desc = "Save and Quit" })
-- Window
vim.keymap.set("n", "<leader>ws", ":split<cr>", { desc = "Horizontal Split" })
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", { desc = "Vertical Split" })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move to Left Window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move to down Window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move to up Window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move to right Window" })
-- Tab
vim.keymap.set("n", "<leader>tn", ":tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader>tc", ":tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader>to", ":tabonly<cr>", { desc = "Close Other Tabs" })
vim.keymap.set("n", "<C-]>", ":tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<C-[>", ":tabprevious<cr>", { desc = "Prev Tab" })
-- Terminal
function FloatTerm()
  local buf = vim.api.nvim_create_buf(false, true)
  local opts = {
    style = "minimal",
    relative = "editor",
    width = math.floor(vim.o.columns * 0.8),
    height = math.floor(vim.o.lines * 0.8),
    row = math.floor(vim.o.lines * 0.1),
    col = math.floor(vim.o.columns * 0.1),
    border = "rounded",
  }
  local win = vim.api.nvim_open_win(buf, true, opts)
  vim.fn.termopen(os.getenv("SHELL"))
  vim.cmd("startinsert")

  vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", "<cmd>close<CR>", { noremap = true, silent = true })
end

vim.keymap.set("n", "<leader>t", FloatTerm, { desc = "Terminal" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "退出終端模式" })
-- Run Code
function RunCode()
  vim.cmd("write")
  local filetype = vim.bo.filetype
  local filename = vim.fn.expand('%:t')
  local output = vim.fn.expand('%:t:r')
  local cmd = ''

  if filetype == 'c' then
    cmd = 'gcc ' .. filename .. ' -o ' .. output .. ' && ./' .. output
  elseif filetype == 'cpp' then
    cmd = 'g++ ' .. filename .. ' -o ' .. output .. ' && ./' .. output
  elseif filetype == 'python' then
    cmd = 'python3 ' .. filename
  elseif filetype == 'java' then
    cmd = 'javac ' .. filename .. ' && java ' .. output
  else
    vim.notify('Unsupported filetype: ' .. filetype, vim.log.levels.ERROR)
    return
  end

  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local opts = {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = (vim.o.lines - height) / 2,
    col = (vim.o.columns - width) / 2,
    border = "rounded",
  }
  vim.api.nvim_open_win(buf, true, opts)

  vim.fn.termopen({ os.getenv("SHELL"), "-c", cmd })
  vim.cmd("startinsert")

  vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", "<cmd>close<CR>", { noremap = true, silent = true })
end

vim.keymap.set("n", "<F4>", RunCode, { desc = "Run Code", noremap = true, silent = true })
