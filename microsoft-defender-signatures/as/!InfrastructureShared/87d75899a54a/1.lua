-- Threat: !InfrastructureShared
-- Name: 87d75899a54a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or #l_0_1 <= 60 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = {
  "c:\\",
  "d:\\",
  "e:\\",
  "f:\\",
  "g:\\",
  "h:\\",
  "l:\\"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {
  "\\documents\\",
  "\\users\\",
  "\\finance\\",
  "\\depts\\",
  "\\internal-secure\\",
  "\\company\\",
  "\\sharedfiles\\",
  "\\secure\\",
  "\\HR\\"
}
if not contains(l_0_1, l_0_3) then
  return mp.CLEAN
end
return mp.INFECTED
