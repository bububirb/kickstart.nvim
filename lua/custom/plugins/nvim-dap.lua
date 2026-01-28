return {
  'mfussenegger/nvim-dap',
  config = function()
    local dap = require 'dap'
    dap.adapters.godot = {
      type = 'server',
      host = '127.0.0.1',
      port = 6006,
    }
    dap.configurations.gdscript = {
      {
        type = 'godot',
        request = 'launch',
        name = 'Launch scene',
        project = '${workspaceFolder}',
      },
    }

    vim.keymap.set('n', 'tb', function() require('dap').toggle_breakpoint() end)
    vim.keymap.set('n', '<Leader>cb', function() require('dap').clear_breakpoints() end)
    vim.keymap.set('n', '<F5>', function() require('dap').continue() end)

    vim.keymap.set({ 'n', 'v' }, '<Leader>ah', function() require('dap.ui.widgets').hover() end)
    vim.keymap.set({ 'n', 'v' }, '<Leader>ap', function() require('dap.ui.widgets').preview() end)

    vim.keymap.set('n', '<Leader>af', function()
      local widgets = require 'dap.ui.widgets'
      widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set('n', '<Leader>as', function()
      local widgets = require 'dap.ui.widgets'
      widgets.centered_float(widgets.scopes)
    end)
  end,
}
