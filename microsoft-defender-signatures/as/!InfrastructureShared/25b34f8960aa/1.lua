-- Threat: !InfrastructureShared
-- Name: 25b34f8960aa
-- Type: 21

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if not string.find(l_0_0, "^c:\\") and not string.find(l_0_0, "^\\\\") then
  return mp.CLEAN
end
if string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\cisco\\cisco", 1, true) then
  return mp.CLEAN
end
local l_0_1 = MpCommon.QueryPersistContext(l_0_0, "ExecutedPENoCert")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.enum_mpattributesubstring("Behavior:")
if #l_0_2 == 0 or l_0_2 == nil then
  return mp.CLEAN
end
for l_0_3, l_0_4 in ipairs(l_0_2) do
  bm.add_related_string("RelatedBMHits", l_0_4, bm.RelatedStringBMReport)
end
return mp.INFECTED
