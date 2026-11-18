-- Threat: !InfrastructureShared
-- Name: 8fd781f9c7e6
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 or #l_0_1 <= 10 then
  return mp.CLEAN
end
local l_0_2 = {
  "\\perflogs\\",
  "\\public\\",
  "c:\\temp",
  "\\windows\\temp\\",
  "\\music\\"
}
if contains(l_0_1, l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN
