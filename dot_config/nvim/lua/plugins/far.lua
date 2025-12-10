return {
  "MagicDuck/grug-far.nvim",
  opts = {
    headerMaxWidth = 30,
    transient = true,
    windowCreationCommand = "45vsplit",
    -- put any other grug-far options here
  },
  cmd = { "GrugFar", "GrugFarWithin" },
  keys = {
    {
      "<leader>sr",
      function()
        local grug = require("grug-far")
        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")

        grug.open({
          transient = true,
          prefills = {
            -- filter to current extension if there is one
            filesFilter = ext and ext ~= "" and "*." .. ext or nil,
          },
        })
      end,
      mode = { "n", "x" },
      desc = "Search & Replace (project / by ext)",
    },

    -- 2) PCRE2 + multiline search (your requirement)
    {
      "<leader><leader>S",
      function()
        require("grug-far").open({
          staticTitle = "grug-far: PCRE2 multiline",
          prefills = {
            -- full rg power; great for complex multi-line regexes :contentReference[oaicite:2]{index=2}
            flags = "--pcre2 --multiline",
          },
        })
      end,
      mode = { "n", "x" },
      desc = "Search & Replace (PCRE2 multiline)",
    },

    -- 3) Literal (fixed-strings) search
    {
      "<leader><leader>sw",
      function()
        require("grug-far").open({
          staticTitle = "grug-far: literal search",
          prefills = {
            flags = "--fixed-strings",
          },
        })
      end,
      mode = { "n", "x" },
      desc = "Search & Replace (literal text)",
    },

    -- 4) Current-file-only search
    {
      "<leader>sf",
      function()
        require("grug-far").open({
          staticTitle = "grug-far: current file",
          prefills = {
            paths = vim.fn.expand("%"),
          },
        })
      end,
      mode = { "n", "x" },
      desc = "Search & Replace (current file)",
    },
  },
}
