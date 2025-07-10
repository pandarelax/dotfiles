return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        buf_ls = {
          cmd = {
            "/nix/store/vnm41rr063lxmfhfgd08cvav5ds1637y-buf-with-plugins-1.52.1/bin/buf",
            "beta",
            "lsp",
            "--timeout",
            "0",
            "--log-format=text",
          },
          filetypes = { "proto" },
          root_dir = require("lspconfig.util").root_pattern("buf.work.yaml", "buf.yaml", ".git") or vim.fn.getcwd(),
        },
      },
    },
  },
}
