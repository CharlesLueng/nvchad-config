local M = {}
local map = vim.keymap.set
local conf = require("nvconfig").ui.lsp

M.load_keymaps = function(bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  -- your custom stuff
  require("which-key").register({
    l = { name = "lsp" },
  }, { prefix = "<leader>" })

  -- map("n", "K", function()
  -- 	vim.lsp.buf.hover()
  -- end, { buffer = bufnr, desc = "Lsp hober" })
  map("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts "Lsp hober")

  map("n", "[d", function()
    require("lspsaga.diagnostic"):goto_prev()
    -- vim.diagnostic.goto_prev({ float = { border = "rounded" } })
  end, opts "Goto prev")

  map("n", "]d", function()
    require("lspsaga.diagnostic"):goto_next()
    -- vim.diagnostic.goto_next({ float = { border = "rounded" } })
  end, opts "Goto next")

  map("n", "[e", function()
    require("lspsaga.diagnostic"):goto_prev { severity = vim.diagnostic.severity.ERROR }
    -- vim.diagnostic.goto_prev({ float = { border = "rounded" } })
  end, opts "Goto prev")

  map("n", "]e", function()
    require("lspsaga.diagnostic"):goto_next { severity = vim.diagnostic.severity.ERROR }
    -- vim.diagnostic.goto_next({ float = { border = "rounded" } })
  end, opts "Goto next")

  map("n", "gD", function()
    vim.lsp.buf.declaration()
  end, opts "LSP declaration")

  map("n", "gd", "<cmd>Lspsaga peek_definition<cr>", opts "LSP definition")

  map("n", "gi", function()
    require("telescope.builtin").lsp_implementations()
  end, opts "LSP implementation")

  map("n", "<leader>ls", function()
    require("telescope.builtin").lsp_document_symbols()
    -- vim.lsp.buf.signature_help()
  end, opts "[D]ocument [S]ymbols")

  map("n", "<leader>lD", function()
    vim.lsp.buf.type_definition()
  end, opts "LSP definition type")

  map("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", opts "LSP rename")

  map("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", opts "LSP code action")

  map("n", "gr", function()
    require("telescope.builtin").lsp_references()
  end, opts "LSP references")

  map("n", "<leader>ld", function()
    vim.diagnostic.open_float { border = "rounded" }
  end, opts "Floating diagnostic")

  map("n", "<leader>lf", function()
    require("conform").format { async = true, lsp_fallback = true }
    -- vim.lsp.buf.format({ async = true })
  end, opts "LSP formatting")

  -- map("n", "<leader>lc", function()
  --   local config = { scope = {} }
  --   config.scope.exclude = { language = {}, node_type = {} }
  --   config.scope.include = { node_type = {} }
  --   local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)
  --
  --   if node then
  --     local start_row, _, end_row, _ = node:range()
  --     if start_row ~= end_row then
  --       vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
  --       vim.api.nvim_feedkeys("_", "n", true)
  --     end
  --   end
  -- end, { desc = "blankline jump to current context" })
end

-- export on_attach & capabilities
M.on_attach = function(client, bufnr)
  M.load_keymaps(bufnr)

  -- setup signature popup
  if conf ~= nil and conf.signature and client ~= nil and client.server_capabilities.signatureHelpProvider then
    require("nvchad.lsp.signature").setup(client, bufnr)
  end
end

-- disable semanticTokens
M.on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end

  client.server_capabilities.documentFormattingRangeProvider = false
  client.server_capabilities.documentFormattingProvider = false
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

M.capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  -- rangeLimit = 5000,
  lineFoldingOnly = true,
}

local lspconfig = require "lspconfig"
local servers = { "omnisharp", "dartls", "lua_ls", "pyright", "tsserver", "volar", "vuels", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  if require("neoconf").get("lspconfig." .. lsp .. ".enabled") == false then
    goto continue
  end

  local opts = {
    on_init = M.on_init,
    on_attach = M.on_attach,
    capabilities = M.capabilities,
  }

  local has_custom_opts, server_custom_opts = pcall(require, "configs.lspconfig.settings." .. lsp)

  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end

  lspconfig[lsp].setup(opts)
  ::continue::
end

return M
