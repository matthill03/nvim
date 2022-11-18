local colourscheme = "aurora"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colourscheme)
if not status_ok then
  vim.notify("colourscheme " .. colourscheme .. " not found")
  return
end

