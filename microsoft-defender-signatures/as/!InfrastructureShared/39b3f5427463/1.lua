-- Threat: !InfrastructureShared
-- Name: 39b3f5427463
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil and mp.bitand(l_0_3.reason_ex, 1) == 1 and string.find(string.lower(l_0_3.image_path), "\\wmiprvse.exe", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
