local status, project = pcall(require, "project_nvim")
if not status then
    vim.notify("no project_nvim")
  return
end

-- nvim-tree support
vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
  detection_methods = { "pattern" },
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".sln" },
})

local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("no telescope")
  return
end
pcall(telescope.load_extension, "projects")
