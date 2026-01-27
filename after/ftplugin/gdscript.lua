vim.lsp.enable 'gdscript'

local port = os.getenv 'GDScript_Port' or '6005'
local cmd = vim.lsp.rpc.connect('127.0.0.1', tonumber(port))

---@type vim.lsp.Config
vim.lsp.start {
  name = 'godot',
  cmd = cmd,
  root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
  filetypes = { 'gd', 'gdscript', 'gdscript3' },
  root_markers = { 'project.godot', '.git' },
  on_attach = function(client, bufnr) end,
}
