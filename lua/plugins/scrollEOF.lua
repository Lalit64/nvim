local M = {}

local mode_disabled = false
local filetype_disabled = false

local function check_eof_scrolloff()
  if mode_disabled or filetype_disabled then
    return
  end

  local win_height = vim.api.nvim_win_get_height(0)
  local win_view = vim.fn.winsaveview()
  local scrolloff = math.min(vim.o.scrolloff + 5, math.floor(win_height / 2))
  local scrolloff_line_count = win_height - (vim.fn.line "w$" - win_view.topline + 1)
  local distance_to_last_line = vim.fn.line "$" - win_view.lnum

  if distance_to_last_line < scrolloff and scrolloff_line_count + distance_to_last_line < scrolloff then
    win_view.topline = win_view.topline + scrolloff - (scrolloff_line_count + distance_to_last_line)
    vim.fn.winrestview(win_view)
  end
end

M.setup = function(opts)
  local default_opts = {
    pattern = "*",
    insert_mode = false,
    disabled_filetypes = {},
    disabled_modes = {},
  }

  if opts == nil then
    opts = default_opts
  else
    for key, value in pairs(default_opts) do
      if opts[key] == nil then
        opts[key] = value
      end
    end
  end

  local disabled_filetypes_hashmap = {}
  for _, val in pairs(opts.disabled_filetypes) do
    disabled_filetypes_hashmap[val] = true
  end
  opts.disabled_filetypes = disabled_filetypes_hashmap

  local disabled_modes_hashmap = {}
  for _, val in pairs(opts.disabled_modes) do
    disabled_modes_hashmap[val] = true
  end
  opts.disabled_modes = disabled_modes_hashmap

  local autocmds = { "CursorMoved" }
  if opts.insert_mode then
    table.insert(autocmds, "CursorMovedI")
  end

  local scrollEOF_group = vim.api.nvim_create_augroup("ScrollEOF", { clear = true })
  vim.api.nvim_create_autocmd("BufEnter", {
    group = scrollEOF_group,
    pattern = opts.pattern,
    callback = function()
      filetype_disabled = opts.disabled_filetypes[vim.o.filetype] == true
    end,
  })

  vim.api.nvim_create_autocmd("ModeChanged", {
    group = scrollEOF_group,
    pattern = opts.pattern,
    callback = function()
      mode_disabled = opts.disabled_modes[vim.api.nvim_get_mode().mode] == true
    end,
  })

  vim.api.nvim_create_autocmd(autocmds, {
    group = scrollEOF_group,
    pattern = opts.pattern,
    callback = check_eof_scrolloff,
  })
end

return M
