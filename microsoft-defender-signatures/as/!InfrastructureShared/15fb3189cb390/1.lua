-- Threat: !InfrastructureShared
-- Name: 15fb3189cb390
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[1].utf8p1))
end
if l_0_0 == nil or not string.match(l_0_0, "\\appdata\\local\\temp\\[0-9a-f]+\\") then
  return mp.CLEAN
end
return mp.INFECTED
