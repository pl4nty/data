-- Threat: !InfrastructureShared
-- Name: 4bd7d8ebb465
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if type(l_0_0) ~= "string" or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if type(l_0_1) ~= "string" or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2, l_0_3 = string.match(l_0_1, "^%s*\"([^\"]+)\"%s+(.*)$")
if l_0_2 == nil then
  l_0_2, l_0_3 = string.match(l_0_1, "^%s*([^%s\"]+)%s+(.*)$")
end
if l_0_2 == nil or l_0_3 == nil then
  return mp.CLEAN
end
if not string.find(l_0_2, "\\appdata\\roaming\\kb[0-9]+\\") then
  return mp.CLEAN
end
local l_0_4 = string.match(l_0_2, "([^\\\\]+)$")
if l_0_4 ~= "bun.exe" and l_0_4 ~= "java.exe" and l_0_4 ~= "javaw.exe" then
  return mp.CLEAN
end
if not string.find(l_0_3, ".js", 1, true) and not string.find(l_0_3, ".java", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
