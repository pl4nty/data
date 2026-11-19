-- Threat: !InfrastructureShared
-- Name: 32b3a5e07230
-- Type: 21

local l_0_0 = bm.get_process_relationships()
for l_0_1, l_0_2 in ipairs(l_0_0) do
  if l_0_2.image_path ~= nil then
    bm.add_related_file(l_0_2.image_path)
  end
end
return mp.INFECTED
