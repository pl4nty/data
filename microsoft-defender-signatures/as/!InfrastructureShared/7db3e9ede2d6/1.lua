-- Threat: !InfrastructureShared
-- Name: 7db3e9ede2d6
-- Type: 21

if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
  l_0_0 = string.gsub(l_0_0, "\"", "")
  l_0_0 = string.gsub(l_0_0, "'", "")
  local l_0_1 = false
  local l_0_2 = false
  local l_0_3 = false
  if string.find(l_0_0, "http", 1, true) or string.find(l_0_0, "%d+%.%d+%.%d+%.%d+") then
    l_0_1 = true
  end
  if string.find(l_0_0, "iwr ", 1, true) or string.find(l_0_0, "invoke-webrequest", 1, true) or string.find(l_0_0, "irm", 1, true) or string.find(l_0_0, "invoke-restmethod", 1, true) or string.find(l_0_0, ".downloadstring(", 1, true) or string.find(l_0_0, "curl", 1, true) or string.find(l_0_0, "wget", 1, true) or string.find(l_0_0, "& \\w", 1, true) then
    l_0_2 = true
  end
  if string.find(l_0_0, "iex", 1, true) or string.find(l_0_0, "|powershell", 1, true) or string.find(l_0_0, ").invoke()", 1, true) or string.find(l_0_0, "cscript //nologo $", 1, true) or string.find(l_0_0, "invoke-expression", 1, true) or string.find(l_0_0, "c:\\users\\public\\", 1, true) then
    l_0_3 = true
  end
  if l_0_1 and l_0_2 and l_0_3 then
    return mp.INFECTED
  end
end
return mp.CLEAN
