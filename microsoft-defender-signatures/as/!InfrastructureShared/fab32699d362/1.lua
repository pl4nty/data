-- Threat: !InfrastructureShared
-- Name: fab32699d362
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[2].utf8p1))
end
if l_0_0 ~= nil and not string.find(l_0_0, "python", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
