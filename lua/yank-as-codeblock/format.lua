---@param opts { content: string, path: string, lang: string, lstart: integer, lend: integer }
---@return string
local function format(opts)
  local range
  if opts.lstart == opts.lend then
    range = tostring(opts.lstart)
  else
    range = opts.lstart .. "-" .. opts.lend
  end
  return table.concat({
    opts.path .. ":" .. range,
    "```" .. opts.lang,
    opts.content,
    "```",
  }, "\n")
end

return format
