return {
  'nvim-lualine/lualine.nvim',
  opts = {
    tabline = {
      lualine_a = {'buffers'},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {'tabs'}
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
};

