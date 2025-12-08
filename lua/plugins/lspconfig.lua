return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- 1. Mason（インストーラー）を起動
    require("mason").setup()

    -- 2. Mason-LSPConfig でサーバーを自動設定する
    -- handlers オプションを使うのが現在の正解です
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls" }, -- 自動インストールしたいサーバー
      
      -- ここで各サーバーの設定を自動化します
      handlers = {
        -- デフォルトの設定（全てのサーバーに適用）
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,

        -- Lua言語サーバー専用の設定
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
        end,
      },
    })
  end,
}
