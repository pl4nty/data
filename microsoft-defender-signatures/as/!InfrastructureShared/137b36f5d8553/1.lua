-- Threat: !InfrastructureShared
-- Name: 137b36f5d8553
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -11) == "svchost.exe" then
  return mp.CLEAN
end
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
return mp.INFECTED
