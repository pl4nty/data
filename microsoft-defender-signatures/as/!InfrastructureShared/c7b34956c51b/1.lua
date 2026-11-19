-- Threat: !InfrastructureShared
-- Name: c7b34956c51b
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil and string.find(l_0_3.image_path, "outlook.exe", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
