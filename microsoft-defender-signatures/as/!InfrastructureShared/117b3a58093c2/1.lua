-- Threat: !InfrastructureShared
-- Name: 117b3a58093c2
-- Type: 21

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2:match("mkdir (/.*)$")
end
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[5].utf8p2
end
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_2 = this_sigattrlog[6].utf8p2
end
local l_0_3, l_0_4 = bm.get_process_relationships()
for l_0_5, l_0_6 in ipairs(l_0_3) do
  if l_0_6.image_path ~= nil and (string.find(l_0_6.image_path, "/installd", -9, true) or string.find(l_0_6.image_path, "/package_script_service", -23, true)) and string.find(l_0_1, l_0_0, 1, true) and string.find(l_0_2, l_0_0, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
