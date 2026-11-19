-- Threat: !InfrastructureShared
-- Name: f7b32d35c229
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[2].utf8p1))
end
if l_0_0 ~= nil and not string.find(l_0_0, "rar", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
