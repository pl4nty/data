-- Threat: !InfrastructureShared
-- Name: 15bd72bb64bc0
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 ~= nil then
  l_0_1 = string.lower(l_0_1)
end
if not l_0_1 or #l_0_1 <= 60 then
  return mp.CLEAN
end
if 450 < #l_0_1 then
  return mp.CLEAN
end
local l_0_2 = string.gsub(l_0_1, "[\"'`^()+#&]", "")
if not contains(l_0_2, {"www", "http"}) then
  return mp.CLEAN
end
if isIEXfound(l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN
