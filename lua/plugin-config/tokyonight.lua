local status, tokyonight = pcall(require, "tokyonight")
if not status then
    vim.notify("No tokyonight")
    return
end
tokyonight.setup({
    style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    transparent = false -- Enable this to disable setting the background color
})
