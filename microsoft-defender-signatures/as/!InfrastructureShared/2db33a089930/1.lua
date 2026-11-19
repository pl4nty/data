-- Threat: !InfrastructureShared
-- Name: 2db33a089930
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  local l_0_1 = string.match(l_0_0, "winword%.exe\".+\"(.+%.doc)") .. "\000"
  mp.ReportLowfi(l_0_1, 2736322605)
end
return mp.INFECTED
