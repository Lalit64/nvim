return {
  "nvim-treesitter",
  lazy = false,
  load = function(name)
    vim.cmd.packadd(name)
  end,
  after = function()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local buf, filetype = args.buf, args.match

        local language = vim.treesitter.language.get_lang(filetype)
        if not language then
          return
        end

        -- check if parser exists and load it
        if not vim.treesitter.language.add(language) then
          return
        end
        -- enables syntax highlighting and other treesitter features
        vim.treesitter.start(buf, language)
      end,
    })

    local map = require("utils").map

    map("v", "<leader>/", "gc", "Comment", true)
    map("n", "<leader>/", "gcc", "Comment", true)
  end,
}
