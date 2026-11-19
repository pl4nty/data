-- Threat: !InfrastructureShared
-- Name: b1b3e7cfc3b9
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_0, l_0_1 = bm.get_process_relationships()
  if l_0_0 == nil then
    return mp.CLEAN
  end
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    if l_0_3.image_path ~= nil and mp.bitand(l_0_3.reason_ex, 1) == 1 and string.find(string.lower(l_0_3.image_path), "\\msiexec.exe", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
