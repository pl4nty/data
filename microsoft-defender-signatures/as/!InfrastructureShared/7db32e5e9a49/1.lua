-- Threat: !InfrastructureShared
-- Name: 7db32e5e9a49
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0):match("-ap \"([^\"]+)\"")
  bm.add_related_string("ReconFromAppPool", l_0_0, bm.RelatedStringBMReport)
end
return mp.INFECTED
