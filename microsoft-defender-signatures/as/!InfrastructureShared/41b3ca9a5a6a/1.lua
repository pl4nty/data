-- Threat: !InfrastructureShared
-- Name: 41b3ca9a5a6a
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = l_0_0 .. ".zip"
if MpCommon.QueryPersistContext(l_0_0, "NewlyCreatedZip") then
  bm.add_related_file(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
