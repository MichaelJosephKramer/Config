-- Language servers. Neovim 0.12 resolves server definitions from `lsp/` dirs on
-- the runtimepath, which is exactly what nvim-lspconfig now ships -- so the
-- plugin supplies cmd/filetypes/root_markers and `vim.lsp.enable` turns them on.
-- Anything below is only the deltas from those defaults.
--
-- Servers come from Homebrew (see Brewfile); nothing here installs them.
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "saghen/blink.cmp" },
  config = function()
    -- Advertise the completion capabilities blink adds on top of core Neovim's.
    vim.lsp.config("*", {
      capabilities = require("blink.cmp").get_lsp_capabilities(nil, true),
    })

    -- luacheck already handles linting, so lua_ls is here for navigation and
    -- completion. It still needs to be told about `vim` when editing this repo.
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    })

    -- ruff (via nvim-lint and conform) owns lint + format for Python, so
    -- basedpyright is types-and-navigation only and must not duplicate them.
    vim.lsp.config("basedpyright", {
      settings = {
        basedpyright = {
          disableOrganizeImports = true,
          analysis = { typeCheckingMode = "standard" },
        },
      },
    })

    -- typescript-language-server is a wrapper around tsserver.js, which ships
    -- inside the `typescript` package rather than with the server itself.
    -- TypeScript 7 dropped that file (it is the native Go compiler now) and
    -- Homebrew's formula followed, so on a project with no local TypeScript 5.x
    -- the server exits and every JS/TS buffer gets a "Could not find a valid
    -- TypeScript installation" error. These two lookups make that impossible:
    -- the workspace copy is preferred so a project pins its own version, a
    -- global install (mise: `mise use -g npm:typescript@5`) covers loose JS
    -- files, and with neither the server simply never starts.
    local function workspace_tsserver(root)
      local dir = root
      while dir and dir ~= "" do
        local candidate = dir .. "/node_modules/typescript/lib/tsserver.js"
        if vim.uv.fs_stat(candidate) then
          return candidate
        end
        local parent = vim.fs.dirname(dir)
        if parent == dir then
          break
        end
        dir = parent
      end
    end

    -- Derived from whatever `tsc` is on PATH rather than a hardcoded prefix, so
    -- this keeps working across mise version bumps, Homebrew and plain npm.
    local global_tsserver = function()
      local tsc = vim.fn.exepath("tsc")
      if tsc == "" then
        return nil
      end
      local dir = vim.fs.dirname(vim.uv.fs_realpath(tsc) or tsc)
      while dir and dir ~= "" do
        for _, candidate in ipairs({
          dir .. "/typescript/lib/tsserver.js",
          dir .. "/lib/tsserver.js",
        }) do
          if vim.uv.fs_stat(candidate) then
            return candidate
          end
        end
        local parent = vim.fs.dirname(dir)
        if parent == dir then
          break
        end
        dir = parent
      end
    end

    vim.lsp.config("ts_ls", {
      root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(vim.api.nvim_buf_get_name(bufnr), {
          "tsconfig.json",
          "jsconfig.json",
          "package.json",
          ".git",
        })
        if root and (workspace_tsserver(root) or global_tsserver()) then
          on_dir(root)
        end
      end,
      -- Only point at the global copy when the workspace has none; otherwise
      -- leave it unset so the server resolves the project's own TypeScript.
      -- Mutates the initialize params rather than config.init_options, which
      -- Neovim has already copied into them by the time this runs.
      before_init = function(params, config)
        if not workspace_tsserver(config.root_dir) then
          params.initializationOptions = vim.tbl_deep_extend("force", params.initializationOptions or {}, {
            tsserver = { path = global_tsserver() },
          })
        end
      end,
    })

    vim.lsp.enable({
      "lua_ls",
      "ruby_lsp",
      "ts_ls",
      "basedpyright",
      "yamlls",
    })

    -- Neovim 0.12 maps grn/gra/grr/gri/gO/K out of the box; these are the
    -- gaps. fzf-lua is used for the list-producing ones so results land in the
    -- same picker as <leader>t / <leader>r rather than the quickfix list.
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
      callback = function(args)
        local function map(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = desc })
        end

        map("gd", "<cmd>FzfLua lsp_definitions<cr>", "Go to definition")
        map("gD", vim.lsp.buf.declaration, "Go to declaration")
        map("grr", "<cmd>FzfLua lsp_references<cr>", "List references")
        map("gri", "<cmd>FzfLua lsp_implementations<cr>", "List implementations")
        map("<leader>s", "<cmd>FzfLua lsp_document_symbols<cr>", "Document symbols")

        -- Inlay hints are off by default; <leader>h toggles them per buffer
        -- because they are useful in bursts and noisy the rest of the time.
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client:supports_method("textDocument/inlayHint") then
          map("<leader>h", function()
            local filter = { bufnr = args.buf }
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(filter), filter)
          end, "Toggle inlay hints")
        end
      end,
    })
  end,
}
