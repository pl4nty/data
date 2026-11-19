-- Threat: !InfrastructureShared
-- Name: 21b35f8b4cb3
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil and string.find(l_0_3.image_path, "svchost.exe", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
