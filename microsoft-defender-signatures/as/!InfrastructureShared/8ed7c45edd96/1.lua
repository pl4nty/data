-- Threat: !InfrastructureShared
-- Name: 8ed7c45edd96
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 ~= nil then
  l_0_1 = string.lower(l_0_1)
  if isIEXfound(l_0_1) then
    return mp.INFECTED
  end
end
return mp.CLEAN
