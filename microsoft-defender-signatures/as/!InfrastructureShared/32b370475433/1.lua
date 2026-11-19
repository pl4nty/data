-- Threat: !InfrastructureShared
-- Name: 32b370475433
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
  mp.ReportLowfi(l_0_0, 3672992343)
end
return mp.INFECTED
