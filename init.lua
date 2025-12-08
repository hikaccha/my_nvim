local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 【追加】ここから下を追加してください
-- lua/plugins ディレクトリ内のファイルを自動で読み込みます
require("lazy").setup("plugins")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.laststatus = 2
vim.opt.statusline = "%l%L"

vim.opt.clipboard = "unnamedplus"

