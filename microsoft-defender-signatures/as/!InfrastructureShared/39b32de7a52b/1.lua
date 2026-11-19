-- Threat: !InfrastructureShared
-- Name: 39b32de7a52b
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
  l_0_1 = "JsonPayload"
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
  l_0_1 = "MaliciousPackage"
end
if l_0_1 ~= nil and l_0_0 ~= nil then
  bm.add_related_string(l_0_1, l_0_0, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
