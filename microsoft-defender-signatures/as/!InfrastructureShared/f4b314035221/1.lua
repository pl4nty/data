-- Threat: !InfrastructureShared
-- Name: f4b314035221
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[3].utf8p1))
end
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_1 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[4].utf8p1))
end
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "dns_log", 1, true) or string.find(l_0_1, "dns_log", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
