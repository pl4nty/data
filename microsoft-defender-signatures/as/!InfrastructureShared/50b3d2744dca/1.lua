-- Threat: !InfrastructureShared
-- Name: 50b3d2744dca
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  l_0_1 = sysio.GetFileSize(l_0_0)
  if l_0_1 < 1000000 then
    return mp.INFECTED
  end
end
return mp.CLEAN
