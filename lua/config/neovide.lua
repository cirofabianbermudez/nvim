if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  local opt = { noremap = true }

  vim.o.guifont = "Hack Nerd Font Mono:h12"

  local scale_factor = 1.0
  vim.g.neovide_scale_factor = scale_factor

  function zoom_in()
    print("Zoom In")
    scale_factor = scale_factor + 0.1
    vim.g.neovide_scale_factor = scale_factor
  end
  vim.api.nvim_set_keymap('n', '<C-+>', "<cmd>lua zoom_in()<CR>", opt)

  function zoom_out()
    print("Zoom Out")
    scale_factor = scale_factor - 0.1
    vim.g.neovide_scale_factor = scale_factor
  end
  vim.api.nvim_set_keymap('n', '<C-->', "<cmd>lua zoom_out()<CR>", opt)

  vim.g.neovide_fullscreen = false
  vim.g.neovide_remember_window_size = true

  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_trail_size = 0

  vim.g.neovide_transparency = 0.9

end

