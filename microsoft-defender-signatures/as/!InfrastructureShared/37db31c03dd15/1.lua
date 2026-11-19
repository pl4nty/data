-- Threat: !InfrastructureShared
-- Name: 37db31c03dd15
-- Type: 21

local l_0_0 = ""
if this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7].utf8p2
elseif this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8].utf8p2
elseif this_sigattrlog[9].matched then
  l_0_0 = this_sigattrlog[9].utf8p2
elseif this_sigattrlog[10].matched then
  l_0_0 = this_sigattrlog[10].utf8p2
end
if l_0_0 ~= nil and l_0_0 ~= "" and sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
