-- Threat: !InfrastructureShared
-- Name: 7db3fda9d3e9
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
  mp.ReportLowfi(l_0_0, 3406851116)
end
return mp.INFECTED
