-- Threat: !InfrastructureShared
-- Name: 9dd7846344b5
-- Type: 21
-- Includes: BMLuaLib

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 ~= nil then
  l_0_1 = string.lower(l_0_1)
end
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
  "iex",
  "invoke-expression"
}
if not contains(l_0_1, l_0_3) then
  return mp.CLEAN
end
local l_0_4 = {
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
if not contains(l_0_1, l_0_4) then
  return mp.CLEAN
end
return mp.INFECTED
