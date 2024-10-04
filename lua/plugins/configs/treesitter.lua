local options = {
  ensure_installed = { "tsx", "typescript", "toml", "json",  "yaml", "go", "css", "html", "lua", "vim", "vimdoc", "purescript" },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  -- list of language that will be disabled
  -- disable = { },
  -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
  disable = function(_, buf)
    local max_filesize = 100 * 1024 -- 100 KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    if ok and stats and stats.size > max_filesize then
        return true
    end
  end,
  autotag = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true,
    disable = {}
  },
}

return options
