-- Threat: !InfrastructureShared
-- Name: 75b311f67fd4
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil and (string.find(l_0_3.image_path, "google chrome", 1, true) or string.find(l_0_3.image_path, "safari", 1, true) or string.find(l_0_3.image_path, "firefox", 1, true)) then
    return mp.INFECTED
  end
end
return mp.CLEAN
