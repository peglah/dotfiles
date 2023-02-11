return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()

--    vim.cmd([[highlight IndentBlanklineIndent1 guifg=#9d0006 gui=nocombine]], false)
--    vim.cmd([[highlight IndentBlanklineIndent2 guifg=#b57614 gui=nocombine]], false)
--    vim.cmd([[highlight IndentBlanklineIndent3 guifg=#79740e gui=nocombine]], false)
--    vim.cmd([[highlight IndentBlanklineIndent4 guifg=#076678 gui=nocombine]], false)
--    vim.cmd([[highlight IndentBlanklineIndent5 guifg=#427b58 gui=nocombine]], false)
--    vim.cmd([[highlight IndentBlanklineIndent6 guifg=#8f3f71 gui=nocombine]], false)

    require('indent_blankline').setup({
--      char_highlight_list = {
--        "IndentBlanklineIndent1",
--        "IndentBlanklineIndent2",
--        "IndentBlanklineIndent3",
--        "IndentBlanklineIndent4",
--        "IndentBlanklineIndent5",
--        "IndentBlanklineIndent6",
--      },
    })
  end
}
