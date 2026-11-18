-- Threat: !InfrastructureShared
-- Name: 7fb39235937b
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil and string.lower(string.sub(l_0_3.image_path, -4)) == "sshd" then
    return mp.INFECTED
  end
end
return mp.CLEAN
