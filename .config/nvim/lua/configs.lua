-- ==================================================
-- NERDTree
-- ==================================================
-- euqivalent to
-- nnoremap <F2> :NERDTreeToggle<CR>
vim.api.nvim_set_keymap(
  "n",
  "<F2>",
  ":NERDTreeToggle<CR>",
  { noremap = true }
 )

-- ==================================================
-- LSP and CMP
-- ==================================================
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')
-- lspconfig key mappings -- suggested in https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
local opts = { noremap=true, silent=true }
local my_custom_on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- print "my_custom_on_attach"
end

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
  'clangd',
  'rust_analyzer',
  'pyright',
  'tsserver',
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end
-- Haskell lsp
lspconfig.hls.setup({
  on_attach = my_custom_on_attach,
  settings = {
    haskell = {
      hlintOn = true,
      formattingProvider = "fourmolu"
    }
  }
})
-- Turtle file lsp -- turtle-language-server
-- NOT WORKING
--local configs = require 'lspconfig.configs'
--
--if not configs.tls then -- if not defined, define it
--  configs.tls = {
--    default_config = {
--      cmd = {'/usr/local/lib/node_modules/turtle-language-server'},
--      filetypes = {'ttl'},
--      --root_dir = function(fname)
--      --  return lspconfig.util.find_git_ancestor(fname)
--      --end,
--      settings = {},
--    };
--  }
--end
--
----lspconfig.tls.setup{}
--lspconfig.tls.setup {
--    --capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--    on_attach = my_custom_on_attach
--}

-- reStructuredText lsp -- RST LSP
-- Register rst-ls with lspconfig
--local configs = require "lspconfig/configs"
----local util = require "lspconfig/util"
--
--if not configs.rst_language_server then -- if not defined, define it
--  configs.rst_language_server = {
--    default_config = {
--      --cmd = { "rst-ls" },
--      --filetypes = { ".rst", "rst", "diocan" },
--      -- root_dir = util.path.dirname,
--      --
--      --cmd = { "~/.local/lib/python3.10/site-packages/rst_language_server" },
--      cmd = { "/home/nyriu/.local/bin/rst-ls" },
--      filetypes = { ".rst", "rst" },
--      root_dir = function(fname)
--        return lspconfig.util.find_git_ancestor(fname)
--      end,
--      settings = {},
--    },
--
--    --docs = {
--    --  description = [[
--    --  https://github.com/digitalernachschub/rst-language-server
--    --  Server implementation of the Language Server Protocol for reStructuredText.
--    --  ]],
--    --  default_config = {
--    --    root_dir = [[root_pattern(".git")]],
--    --  },
--    --},
--  }
--end
--lspconfig.rst_language_server.setup {
--    on_attach = my_custom_on_attach
--}




-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- down
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),-- up
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'cmdline' },
    { name = 'nvim_lua' },
  },
}




-- { DEPRECATED
-- -- :LspInstall <language>
-- require'lspinstall'.setup() -- important
-- local servers = require'lspinstall'.installed_servers()
-- for _, server in pairs(servers) do
--   require'lspconfig'[server].setup{}
-- end
-- DEPRECATED }


-- ==================================================
-- Markdown
-- ==================================================
-- noremap <leader>p :Glow<CR>
vim.api.nvim_set_keymap(
  "n",
  "<leader>p",
  ":Glow<CR>",
  { noremap = true }
)
vim.g.glow_binary_path = vim.env.HOME .. "/bin"
-- TODO
--vim.g.glow_border = "rounded"
--vim.g.glow_width = 120
vim.g.glow_use_pager = true
vim.g.glow_style = "light"


-- ==================================================
-- Syntax
-- ==================================================
-- TODO
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "cpp", "c", "lua", "make", "markdown", "haskell" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- ==================================================
-- Git
-- ==================================================
-- TODO
require('gitsigns').setup()


-- ==================================================
-- Quality Of Life
-- ==================================================
require('Comment').setup()


