-- Threat: !InfrastructureShared
-- Name: 42fb368998f3f
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_imagepath():lower()
if l_0_0 ~= nil and IsExcludedByImagePath(l_0_0) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = bm.get_process_relationships()
for l_0_3, l_0_4 in ipairs(l_0_1) do
  bm.add_related_file(l_0_4.image_path)
end
return mp.INFECTED
