local M = {
  cmd = { "dotnet", "/home/charles/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").definition_handler,
    ["textDocument/references"] = require("omnisharp_extended").references_handler,
    ["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
  },
  on_attach = function(client, bufnr)
    require("configs.lspconfig").on_attach()

    local map = vim.keymap.set

    map("n", "gd", function()
      -- require("telescope.builtin").lsp_definitions()
      vim.lsp.buf.definition()
    end, { buffer = bufnr, desc = "LSP definition" })

    map("n", "gi", function()
      vim.lsp.buf.implementation()
    end, { buffer = bufnr, desc = "LSP implementation" })

    map("n", "gr", function()
      vim.lsp.buf.references()
    end, { buffer = bufnr, desc = "LSP references" })
  end,
  -- Enables support for reading code style, naming convention and analyzer
  -- settings from .editorconfig.
  enable_editorconfig_support = true,

  -- If true, MSBuild project system will only load projects for files that
  -- were opened in the editor. This setting is useful for big C# codebases
  -- and allows for faster initialization of code navigation features only
  -- for projects that are relevant to code that is being edited. With this
  -- setting enabled OmniSharp may load fewer projects and may thus display
  -- incomplete reference lists for symbols.
  enable_ms_build_load_projects_on_demand = false,

  -- Enables support for roslyn analyzers, code fixes and rulesets.
  enable_roslyn_analyzers = false,

  -- Specifies whether 'using' directives should be grouped and sorted during
  -- document formatting.
  organize_imports_on_format = false,

  -- Enables support for showing unimported types and unimported extension
  -- methods in completion lists. When committed, the appropriate using
  -- directive will be added at the top of the current file. This option can
  -- have a negative impact on initial completion responsiveness,
  -- particularly for the first few completion sessions after opening a
  -- solution.
  enable_import_completion = false,

  -- Specifies whether to include preview versions of the .NET SDK when
  -- determining which version to use for project loading.
  sdk_include_prereleases = true,

  -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
  -- true
  analyze_open_documents_only = false,
}

if vim.loop.os_uname().sysname == "Windows_NT" then
  M.cmd = { "dotnet", "C:/Users/lueng/AppData/Local/nvim-data/mason/packages/omnisharp/libexec/OmniSharp.dll" }
end

return M
