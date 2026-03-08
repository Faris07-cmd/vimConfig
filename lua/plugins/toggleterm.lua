return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup{
        size = 15,
        open_mapping = [[<C-\>]], -- Ctrl+\ to toggle
        start_in_insert = true,
        direction = "horizontal",
        close_on_exit = false,
        persist_size = true,
        auto_scroll = true,
      }
end,
  }
}
