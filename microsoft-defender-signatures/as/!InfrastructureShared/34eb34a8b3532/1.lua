-- Threat: !InfrastructureShared
-- Name: 34eb34a8b3532
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
local l_0_1 = false
local l_0_2 = 0
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p2:lower()
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p2:lower()
end
if not isIEXfound(l_0_0) then
  return mp.CLEAN
end
l_0_2 = l_0_0:len()
if 400 < l_0_2 then
  return mp.CLEAN
end
local l_0_3 = "(?:gp|get-itemproperty).{0,10}(?:hkcu|hklm)"
l_0_1, _ = MpCommon.StringRegExpSearch(l_0_3, l_0_0)
if l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
