-- Threat: !InfrastructureShared
-- Name: 1cfd7fd8691a1
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
local l_0_2 = mp.GetScannedPPID()
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
if l_0_3 == nil or #l_0_3 <= 10 then
  return mp.CLEAN
end
l_0_1 = string.match(l_0_3, "%s%-enc%s+([A-Za-z0-9+/]+=*)")
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_0 = MpCommon.Base64Decode(l_0_1)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.gsub(l_0_0, "%z", "")
l_0_0 = l_0_0:lower()
local l_0_4 = {
  "/%?subid=%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x%-%-%-%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x"
}
if contains(l_0_0, l_0_4, false) then
  return mp.INFECTED
end
return mp.CLEAN
