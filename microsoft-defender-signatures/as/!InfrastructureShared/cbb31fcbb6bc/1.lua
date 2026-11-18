-- Threat: !InfrastructureShared
-- Name: cbb31fcbb6bc
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
elseif this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
elseif this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
end
if l_0_0 ~= nil and string.find(l_0_0, "\\wwwroot\\", 1, true) then
  mp.ReportLowfi(l_0_0, 3277719387)
  bm.add_related_file(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
