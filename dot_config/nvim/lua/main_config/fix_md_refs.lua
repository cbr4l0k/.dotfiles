local vim = vim

local M = {}

local function split(str, sep)
  local t = {}
  for s in string.gmatch(str, "([^" .. sep .. "]+)") do
    table.insert(t, s)
  end
  return t
end

-- Clean the URL to remove the specific utm_source and tidy up leftovers.
local function clean_url(url)
  if not url then return url end
  -- remove the exact utm_source parameter whether preceded by ? or &
  url = url:gsub("[?&]utm_source=chatgpt%.com", "")
  -- if we created trailing ? or & by removing the last param, drop them
  url = url:gsub("[?&]+$", "")
  -- drop a trailing slash (your examples do this)
  url = url:gsub("/+$", "")
  return url
end

function M.fix()
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  -- 1) Collect reference definitions → refs[id] = { url=..., title=... }
  local refs = {}
  local has_any_refs = false
  for _, l in ipairs(lines) do
    -- With title
    local id, url, title = l:match([[^%[(%d+)%]:%s*(%S+)%s*"%s*([^"]-)%s*"%s*$]])
    if not id then
      -- Without title
      id, url = l:match([[^%[(%d+)%]:%s*(%S+)%s*$]])
    end
    if id and url then
      has_any_refs = true
      refs[id] = {
        url = clean_url(url),
        title = title, -- may be nil
      }
    end
  end

  if not has_any_refs then
    vim.notify("No reference-style links like [n]: https://... found.", vim.log.levels.INFO)
    return
  end

  -- 2) Replace [label][n] → [Title](URL) (or [label](URL) if no Title)
  local text = table.concat(lines, "\n")
  text = text:gsub("%[([^%[%]]-)%]%[(%d+)%]", function(label, n)
    local r = refs[n]
    if r and r.url then
      local shown = (r.title and #r.title > 0) and r.title or label
      return string.format("[%s](%s)", shown, r.url)
    end
    -- If we didn't have a matching ref, keep original
    return string.format("[%s][%s]", label, n)
  end)

  -- 3) Remove the reference lines themselves
  local new_lines = {}
  for _, l in ipairs(split(text, "\n")) do
    if not l:match([[^%[(%d+)%]:%s*%S+]]) then
      table.insert(new_lines, l)
    end
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, new_lines)
  vim.notify("Markdown references inlined and cleaned.", vim.log.levels.INFO)
end

-- Create a user command
vim.api.nvim_create_user_command("FixMdRefs", function() M.fix() end, {})

return M
