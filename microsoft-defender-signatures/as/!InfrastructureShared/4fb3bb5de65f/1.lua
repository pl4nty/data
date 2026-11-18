-- Threat: !InfrastructureShared
-- Name: 4fb3bb5de65f
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
bm.add_related_string("MockSystem32_File", l_0_0, bm.RelatedStringBMReport)
if sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
end
return mp.INFECTED
