-- Threat: !InfrastructureShared
-- Name: d8b3828b39cf
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1
if contains(l_0_0, "powershell") then
  l_0_1 = l_0_1 + 1
end
if contains(l_0_0, "cmd.exe") then
  l_0_1 = l_0_1 + 1
end
if contains(l_0_0, "wscript") then
  l_0_1 = l_0_1 + 1
end
if contains(l_0_0, "mshta") then
  l_0_1 = l_0_1 + 1
end
if contains(l_0_0, "jscript") then
  l_0_1 = l_0_1 + 1
end
if contains(l_0_0, "wmic") then
  l_0_1 = l_0_1 + 1
end
if contains(l_0_0, "rundll32") then
  l_0_1 = l_0_1 + 1
end
if contains(l_0_0, "regsvr32") then
  l_0_1 = l_0_1 + 1
end
if 1 < l_0_1 then
  bm_AddRelatedFileFromCommandLine(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
