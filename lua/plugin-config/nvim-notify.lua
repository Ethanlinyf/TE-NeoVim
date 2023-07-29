local status, notify = pcall(require, "notify")
if not status then
  vim.notify("No nvim-notify")
  return
end

notify.setup({
  stages = "static",
  timeout = 5000,
})
vim.notify = notify
