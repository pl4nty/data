-- Threat: !InfrastructureShared
-- Name: 196b3084d32e5
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
local l_0_1
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[6].utf8p1:lower()
end
local l_0_2 = string.match(l_0_1, "(.*\\)")
local l_0_3 = string.match(l_0_0, "(.*\\)")
if l_0_2 == l_0_3 then
  reportSessionInformation()
  return mp.INFECTED
end
return mp.CLEAN
