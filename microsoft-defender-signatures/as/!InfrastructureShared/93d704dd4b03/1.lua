-- Threat: !InfrastructureShared
-- Name: 93d704dd4b03
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
l_0_1 = string.lower(l_0_1)
if l_0_1 and contains(l_0_1, {
  "wscript.exe",
  "cmd.exe",
  "powershell.exe"
}) then
  return mp.INFECTED
end
return mp.CLEAN
