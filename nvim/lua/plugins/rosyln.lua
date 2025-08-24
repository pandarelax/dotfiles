-- ~/.config/nvim/lua/plugins/roslyn_registry.lua
return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup({
        registries = {
          "github:Crashdummyy/mason-registry",
          "github:mason-org/mason-registry",
        },
      })
    end,
  },
  {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      -- opsiyonel: choose_target, ignore_target, broad_search, lock_target
    },
  },
}
