local vim = vim
-- nvim-treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash","bibtex","c","cpp","csv","htmldjango","julia","dot","go",
    "html","javascript","typescript","json","latex","lua",
    "markdown","markdown_inline","objdump","python","rust","vim",
    "vimdoc","xml","yaml","tsx","query"  -- add typescript + query parsers
  },
  sync_install = false,
  auto_install = true, -- requires git + a compiler; set false if you lack them
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false, -- keep this false to avoid dupes
    disable = function(lang, buf)
      -- Disable spell highlighting in treesitter
      return false
    end,
  },
})

-- 1) Add new filetypes to treesitter
vim.filetype.add({
  extension = { mdx = "mdx", base = "base" },
})


-- 2) Add new filetypes to nvim
vim.filetype.add({
  -- Detect and assign filetype based on the entire filename
  filename = {
    [".env"] = "dotenv",
    ["env"] = "dotenv", -- For files named simply "env"
  },
  -- Detect and apply filetypes based on certain patterns of the filenames
  pattern = {
    -- Matches filenames like ".env.example", ".env.local", etc.
    ["%.env%.[%w_.-]+"] = "dotenv",
  },
  -- Detect and assign filetype based on the extension of the filename
  extension = {
    env = "dotenv",
  },
})

--- 3) Map new filetypes to existing treesitter parsers
vim.treesitter.language.register("markdown", "mdx")
vim.treesitter.language.register("yaml", "base")
vim.treesitter.language.register("bash", "dotenv")
