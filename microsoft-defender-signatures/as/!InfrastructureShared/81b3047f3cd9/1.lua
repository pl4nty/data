-- Threat: !InfrastructureShared
-- Name: 81b3047f3cd9
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil then
    if string.find(l_0_3.image_path, "/sbin/sshd", -10, true) then
      return mp.INFECTED
    end
    local l_0_4, l_0_5 = bm.get_process_relationships()
    for l_0_6, l_0_7 in ipairs(l_0_4) do
      if l_0_7.image_path ~= nil and string.find(l_0_7.image_path, "/sbin/sshd", -10, true) then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
