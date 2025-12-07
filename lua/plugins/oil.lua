return {
  "stevearc/oil.nvim",
  -- アイコン表示に必要（オプションですが推奨）
  dependencies = { "nvim-mini/mini.icons", opts = {} },
  
  -- 遅延読み込みを無効化（ディレクトリを開いた瞬間に起動させるため）
  lazy = false,

  -- 【重要】ops ではなく opts です。
  -- また、require("oil").setup(...) の中身だけをここに書きます。
  opts = {
    -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
    default_file_explorer = true,
    -- Id is automatically added at the beginning, and name at the end
    columns = {
      "icon",
      -- "permissions",
      -- "size",
      -- "mtime",
    },
    -- Buffer-local options to use for oil buffers
    buf_options = {
      buflisted = false,
      bufhidden = "hide",
    },
    -- Window-local options to use for oil buffers
    win_options = {
      wrap = false,
      signcolumn = "no",
      cursorcolumn = false,
      foldcolumn = "0",
      spell = false,
      list = false,
      conceallevel = 3,
      concealcursor = "nvic",
    },
    -- Send deleted files to the trash instead of permanently deleting them
    delete_to_trash = false,
    -- Skip the confirmation popup for simple operations
    skip_confirm_for_simple_edits = false,
    -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
    prompt_save_on_select_new_entry = true,
    -- Oil will automatically delete hidden buffers after this delay
    cleanup_delay_ms = 2000,
    lsp_file_methods = {
      enabled = true,
      timeout_ms = 1000,
      autosave_changes = false,
    },
    constrain_cursor = "editable",
    watch_for_changes = false,
    keymaps = {
      ["g?"] = { "actions.show_help", mode = "n" },
      ["<CR>"] = "actions.select",
      ["<C-s>"] = { "actions.select", opts = { vertical = true } },
      ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
      ["<C-t>"] = { "actions.select", opts = { tab = true } },
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = { "actions.close", mode = "n" },
      ["<C-l>"] = "actions.refresh",
      ["-"] = { "actions.parent", mode = "n" },
      ["_"] = { "actions.open_cwd", mode = "n" },
      ["`"] = { "actions.cd", mode = "n" },
      ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
      ["gs"] = { "actions.change_sort", mode = "n" },
      ["gx"] = "actions.open_external",
      ["g."] = { "actions.toggle_hidden", mode = "n" },
      ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },
    use_default_keymaps = true,
    view_options = {
      show_hidden = false,
      is_hidden_file = function(name, bufnr)
        local m = name:match("^%.")
        return m ~= nil
      end,
      is_always_hidden = function(name, bufnr)
        return false
      end,
      natural_order = "fast",
      case_insensitive = false,
      sort = {
        { "type", "asc" },
        { "name", "asc" },
      },
      highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
        return nil
      end,
    },
    extra_scp_args = {},
    extra_s3_args = {},
    git = {
      add = function(path) return false end,
      mv = function(src_path, dest_path) return false end,
      rm = function(path) return false end,
    },
    float = {
      padding = 2,
      max_width = 0,
      max_height = 0,
      border = nil,
      win_options = { winblend = 0 },
      get_win_title = nil,
      preview_split = "auto",
      override = function(conf) return conf end,
    },
    preview_win = {
      update_on_cursor_moved = true,
      preview_method = "fast_scratch",
      disable_preview = function(filename) return false end,
      win_options = {},
    },
    confirmation = {
      max_width = 0.9,
      min_width = { 40, 0.4 },
      width = nil,
      max_height = 0.9,
      min_height = { 5, 0.1 },
      height = nil,
      border = nil,
      win_options = { winblend = 0 },
    },
    progress = {
      max_width = 0.9,
      min_width = { 40, 0.4 },
      width = nil,
      max_height = { 10, 0.9 },
      min_height = { 5, 0.1 },
      height = nil,
      border = nil,
      minimized_border = "none",
      win_options = { winblend = 0 },
    },
    ssh = { border = nil },
    keymaps_help = { border = nil },
  },
}
