return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
    {
      'declancm/cinnamon.nvim',
      config = function() require('cinnamon').setup() end,
      lazy = false
    },
    {
      'ggandor/leap.nvim',
      config = function() require('leap').add_default_mappings() end,
      lazy = false
    },
  {
    'ellisonleao/glow.nvim',
    config = true,
    cmd = "Glow",
    ft = {"markdown"}
  },  
  {
    'Mofiqul/dracula.nvim'
  },  
  {
    'folke/tokyonight.nvim'
  },  
  { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000 
  },
}
