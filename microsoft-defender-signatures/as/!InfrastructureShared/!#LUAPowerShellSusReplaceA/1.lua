-- Threat: !InfrastructureShared
-- Name: !#LUA:PowerShell/SusReplace.A
-- Type: 13
-- MpAttributes: SCRIPT:Powershell/SusReplace.A

local l_0_0 = ""
l_0_0 = tostring(footerpage)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = string.match(l_0_0, "%-replace%s+'([^']+)'")
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_0 = string.gsub(l_0_0, l_0_1, "")
l_0_0 = string.gsub(l_0_0, " ", "")
l_0_0 = string.gsub(l_0_0, "'%+'", "")
l_0_0 = string.gsub(l_0_0, "'", "")
local l_0_2 = false
local l_0_3 = false
if string.find(l_0_0, "iwr", 1, true) or string.find(l_0_0, "irm", 1, true) or string.find(l_0_0, "invoke-webrequest", 1, true) or string.find(l_0_0, "invoke-restmethod", 1, true) or string.find(l_0_0, "iex", 1, true) or string.find(l_0_0, "invoke-expression", 1, true) then
  l_0_2 = true
end
if string.find(l_0_0, "base64", 1, true) or string.find(l_0_0, "system.reflection.assembly", 1, true) then
  l_0_3 = true
end
if l_0_2 and l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
