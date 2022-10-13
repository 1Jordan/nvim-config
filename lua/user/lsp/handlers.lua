local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

M.setup = function()
  local signs = {

    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = false, -- disable virtual text
    signs = {
      active = signs, -- show signs
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_keymaps(bufnr)
  local optsG = {
    mode = "n", -- NORMAL mode
    prefix = "g",
    buffer = bufnr, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

  local mappingsG = {
    ["D"] = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to Declaration"},
    ["d"] = {"<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition"},
    ["K"] = {"<cmd>lua vim.lsp.buf.hover()<CR>", "Display Hover Info"},
    ["I"] = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "List Implementations"},
    ["r"] = {"<cmd>lua vim.lsp.buf.references()<CR>", "List References"},
    ["l"] = {"<cmd>lua vim.diagnostic.open_float()<CR>", "Show Diagnostics"},
  }

  local optsL = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = bufnr, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

  local mappingsL = {
    l = {
      name = "LSP",
      f = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "Format"},
      a = {"<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action"},
      j = {"<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Next Diagnostic"},
      k = {"<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Prev Diagnostic"},
      r = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"},
      s = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help"},
      S = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
      q = {"<cmd>lua vim.diagnostic.setloclist()<CR>", "Quickfix"},
    }
  }

  which_key.register(mappingsG, optsG)
  which_key.register(mappingsL, optsL)

end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end

  if client.name == "sumneko_lua" then
    client.server_capabilities.documentFormattingProvider = false
  end

  lsp_keymaps(bufnr)
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

return M
