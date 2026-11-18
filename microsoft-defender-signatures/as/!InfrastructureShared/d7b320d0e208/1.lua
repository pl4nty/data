-- Threat: !InfrastructureShared
-- Name: d7b320d0e208
-- Type: 21

local l_0_0 = mp.enum_mpattributesubstring("Behavior:Win32/BlockMpTamper")
if #l_0_0 == 0 or l_0_0 == nil then
  return mp.CLEAN
end
for l_0_1, l_0_2 in ipairs(l_0_0) do
  bm.add_related_string("RelatedBMHits", l_0_2, bm.RelatedStringBMReport)
end
return mp.INFECTED
