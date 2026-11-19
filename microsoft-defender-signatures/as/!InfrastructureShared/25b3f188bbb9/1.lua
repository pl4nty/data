-- Threat: !InfrastructureShared
-- Name: 25b3f188bbb9
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil then
    local l_0_4 = mp.bitand(l_0_3.reason_ex, 1)
    if l_0_4 == 1 and string.find(l_0_3.image_path, "wscript", 1, true) ~= nil then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
