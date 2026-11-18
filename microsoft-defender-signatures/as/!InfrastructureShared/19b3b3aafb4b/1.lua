-- Threat: !InfrastructureShared
-- Name: 19b3b3aafb4b
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  bm.add_related_string("SuspSPModuleName", l_0_0, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
