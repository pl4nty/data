-- Threat: !InfrastructureShared
-- Name: 19b3216963af
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  mp.ReportLowfi(l_0_0, 3879253063)
end
return mp.INFECTED
