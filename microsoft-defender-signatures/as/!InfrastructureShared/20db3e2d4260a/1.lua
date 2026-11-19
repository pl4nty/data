-- Threat: !InfrastructureShared
-- Name: 20db3e2d4260a
-- Type: 21

local l_0_0 = this_sigattrlog[3].utf8p1
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  local l_0_1 = sysio.GetFileSize(l_0_0)
  if 50000000 < l_0_1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
