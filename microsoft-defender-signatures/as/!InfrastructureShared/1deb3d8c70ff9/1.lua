-- Threat: !InfrastructureShared
-- Name: 1deb3d8c70ff9
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_0, l_0_1 = bm.get_process_relationships()
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    if l_0_3.image_path ~= nil and string.find(l_0_3.image_path, "xpcproxy", 1, true) then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
