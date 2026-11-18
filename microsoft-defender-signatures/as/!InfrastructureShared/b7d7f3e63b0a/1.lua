-- Threat: !InfrastructureShared
-- Name: b7d7f3e63b0a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
l_0_1 = string.gsub(l_0_1, "%-", "")
l_0_1 = string.gsub(l_0_1, "%^", "")
l_0_1 = string.gsub(l_0_1, "%`", "")
l_0_1 = string.gsub(l_0_1, "%+", "")
if isIEXfound(l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
