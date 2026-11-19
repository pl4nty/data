-- Threat: !InfrastructureShared
-- Name: 9cb3ff2b0752
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
if not l_0_0 then
  return mp.INFECTED
end
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path then
    bm.add_related_file(l_0_3.image_path)
  end
end
return mp.INFECTED
