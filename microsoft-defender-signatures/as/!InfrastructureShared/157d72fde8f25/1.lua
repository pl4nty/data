-- Threat: !InfrastructureShared
-- Name: 157d72fde8f25
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0) or ""
local l_0_2 = string.lower(l_0_1)
local l_0_3 = string.find(l_0_2, "/claude ", 1, true) or string.find(l_0_2, "claude.exe ", 1, true) or string.find(l_0_2, "/claude/versions/", 1, true)
local l_0_4 = string.find(l_0_2, " rg ", 1, true) or string.find(l_0_2, " ugrep ", 1, true)
local l_0_6 = string.find(l_0_2, " --pre", 1, true) ~= nil or string.find(l_0_2, " --filter", 1, true) ~= nil or string.find(l_0_2, " --exec", 1, true) ~= nil
if l_0_3 ~= nil and l_0_4 ~= nil and l_0_3 < l_0_4 and not l_0_6 then
  return mp.CLEAN
end
local l_0_8 = string.find(l_0_1, "%f[%w]nc%s") ~= nil
local l_0_10 = string.find(l_0_1, "%f[%w]telnet%s") ~= nil
if not l_0_8 and not l_0_10 then
  return mp.CLEAN
end
if l_0_8 and string.find(l_0_1, "%f[%w]nc%s+[^|]-%-U%f[%W]") ~= nil then
  return mp.CLEAN
end
return mp.INFECTED
