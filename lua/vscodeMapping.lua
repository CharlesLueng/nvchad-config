local map = vim.keymap.set
local nomap = vim.keymap.del
local vscode = require "vscode"

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
map("n", "<leader><leader>", function()
  vscode.notify "测试"
end)

-- move
map("n", "H", "^")
map("n", "L", "$")
map("n", "j", "gj")
map("n", "k", "gk")
map("n", "[d", function()
  vscode.action "editor.action.marker.prevInFiles"
end)
map("n", "]d", function()
  vscode.action "editor.action.marker.nextInFiles"
end)

-- fold
map("n", "zz", function()
  vscode.action "editor.toggleFold"
end)
map("n", "zr", function()
  vscode.action "editor.foldAll"
end)
map("n", "zo", function()
  vscode.action "editor.unfoldAll"
end)

-- buffer
map("n", "<leader><tab><tab>", function()
  vscode.action "workbench.action.files.newUntitledFile"
  -- vscode.action j
end)

map("n", "<leader><tab>h", function ()
  vscode.action "workbench.action.previousEditorInGroup"
end)

map("n", "<leader><tab>l", function()
  vscode.action "workbench.action.nextEditorInGroup"
end)

map("n", "<leader><tab>o", function()
  vscode.action "workbench.action.closeOtherEditors"
end)

map("n", "<leader>x", function()
  vscode.action "workbench.action.closeActiveEditor"
end)

-- window management
map("n", "<leader>wl", function()
  vscode.action "workbench.action.navigateRight"
end, { desc = "move right" })
map("n", "<leader>wh", function()
  vscode.action "workbench.action.navigateLeft"
end, { desc = "move left" })
map("n", "<leader>wj", function()
  vscode.action "workbench.action.navigateDown"
end, { desc = "move bottom" })
map("n", "<leader>wk", function()
  vscode.action "workbench.action.navigateUp"
end, { desc = "move top" })
map("n", "<leader>ws", function()
  vscode.action "workbench.action.splitEditorDown"
end, { desc = "split" })
map("n", "<leader>wv", function()
  vscode.action "workbench.action.splitEditor"
end, { desc = "vsplit" })
map("n", "<leader>wc", function()
  vscode.action "workbench.action.closeEditorsInGroup"
end, { desc = "close window" })
-- map("n", "<leader>wm", "<CMD>TZFocus<CR>", { desc = "max window" })
map("n", "<leader>w=", function()
  vscode.action "workbench.action.evenEditorWidths"
end, { desc = "window average" })
map("n", "<leader>ww", function()
  vscode.action "workbench.action.navigateEditorGroups"
end)
map("n", "<leader>wm", function ()
  vscode.action "workbench.action.toggleMaximizeEditorGroup"
end)

-- finder
map("n", "<leader>ff", function()
  vscode.action "workbench.action.quickOpen"
end, { desc = "find file" })

map("n", "<leader>fb", function()
  vscode.action("workbench.action.quickOpen", {
    args = {
      "edt ",
    },
  })
end, { desc = "find buffer" })

map("n", "<leader>fo", function()
  vscode.action "workbench.action.files.openFolder"
end, { desc = "" })
map("n", "<leader>fp", function()
  vscode.action "projectManager.listProjects"
end, { desc = "find project" })
map("n", "<leader>fP", function()
  vscode.action "projectManager.listProjectsNewWindow"
end)

-- command
map("n", "<leader>p", function()
  vscode.action "workbench.action.showCommands"
end, { desc = "show commands" })

-- lsp
map("n", "<leader>ls", function()
  vscode.action "workbench.action.gotoSymbol"
end, { desc = "go to symbol" })
map("n", "<leader>lf", function()
  vscode.action "editor.action.formatDocument"
end, { desc = "format document" })
map("n", "<leader>lr", function()
  vscode.action "editor.action.rename"
end, { desc = "rename" })
map("n", "<leader>la", function()
  vscode.action "editor.action.quickFix"
end, { desc = "code action" })
map("n", "K", function()
  vscode.action "editor.action.showDefinitionPreviewHover"
end, { desc = "show definition" })
map("n", "<leader>ld", function()
  vscode.action "workbench.panel.markers.view.focus"
end)
map("n", "gpd", function()
  vscode.action "editor.action.peekDefinition"
end)
map("n", "gh", function()
  vscode.action "editor.action.showDefinitionPreviewHover"
end)
map("n", "gi", function()
  vscode.action "editor.action.goToImplementation"
end)
map("n", "gpi", function()
  vscode.action "editor.action.peekImplementation"
end)
map("n", "gq", function()
  vscode.action "editor.action.quickFix"
end)
map("n", "gr", function()
  vscode.action "editor.action.referenceSearch.trigger"
end)
map("n", "gt", function()
  vscode.action "editor.action.goToTypeDefinition"
end)
map("n", "gpt", function()
  vscode.action "editor.action.peekTypeDefinition"
end)

-- zen mode
map("n", "<leader>zz", function()
  vscode.action "workbench.action.toggleZenMode"
end)

-- explorer
map("n", "<C-n>", function()
  vscode.action "workbench.action.toggleSidebarVisibility"
end)

map("n", "<leader>e", function()
  vscode.action "workbench.files.action.focusFilesExplorer"
end)

-- vscode
map("n", "<leader>vo", function()
  vscode.action "workbench.action.files.openFile"
end)
map("n", "<leader>vf", function()
  vscode.action "workbench.action.files.openFolder"
end)
map("n", "<leader>vN", function()
  vscode.action "workbench.action.newWindow"
end)
map("n", "<leader>vc", function()
  vscode.action "workbench.action.closeWindow"
end)
map("n", "<leader>vs", function()
  vscode.action "workbench.action.files.save"
end)
map("n", "<leader>vS", function()
  vscode.action "workbench.action.files.saveAll"
end)
map("n", "<leader>vt", function()
  vscode.action "todo-tree-view.focus"
end)
map("n", "<leader>vT", function()
  vscode.action "workbench.view.extension.test"
end)
map("n", "<leader>vE", function()
  vscode.action "workbench.view.extensions"
end)
map("n", "<leader>vF", function()
  vscode.action "workbench.action.replaceInFiles"
end)
map("n", "<leader>vG", function()
  vscode.action "workbench.view.scm"
end)
map("n", "<leader>vR", function()
  vscode.action "workbench.action.tasks.restartTask"
end)
map("n", "<leader>vD", function()
  vscode.action "workbench.view.debug"
end)
map("n", "<leader>vB", function()
  vscode.action "workbench.view.extension.bookmarks"
end)
