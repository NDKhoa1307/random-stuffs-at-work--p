---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["<space>"] = "none",
      },
    },
    filesystem = {
      window = {
        mappings = {
          ["H"] = "none",
          ["<space>h"] = "toggle_hidden",
          ["<space>H"] = "toggle_hidden",
        },
      },
    },
  },
}
