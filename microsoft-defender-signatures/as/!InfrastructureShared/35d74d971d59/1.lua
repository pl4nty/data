-- Threat: !InfrastructureShared
-- Name: 35d74d971d59
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = {
  ".shop/",
  ".xyz/",
  ".icu/",
  ".lat/",
  ".fun/",
  ".bet/",
  ".life/",
  ".bond/",
  ".top/",
  ".world/",
  ".click/",
  ".forest/",
  ".run/",
  ".was/",
  ".today/",
  ".cyou/"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
if isIEXfound(l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
