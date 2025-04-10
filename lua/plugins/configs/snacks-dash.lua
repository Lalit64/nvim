local M = {
  enabled = true,
  preset = {
    keys = {
      { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
      { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
      { icon = " ", key = "w", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
      { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
      {
        icon = " ",
        key = "c",
        desc = "Config",
        action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })",
      },
      { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = true },
      { icon = " ", key = "q", desc = "Quit", action = ":qa" },
    },
    header = [[
                                                                         
         ████ ██████           █████      ██                       
        ███████████             █████                               
        █████████ ███████████████████ ███   ███████████     
       █████████  ███    █████████████ █████ ██████████████     
      █████████ ██████████ █████████ █████ █████ ████ █████     
    ███████████ ███    ███ █████████ █████ █████ ████ █████    
   ██████  █████████████████████ ████ █████ █████ ████ ██████   
    ]],
  },
  sections = {
    { section = "header" },
    { section = "keys", gap = 1, padding = 1 },
    { section = "startup" },
  },
}

return M
