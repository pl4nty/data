-- Threat: !InfrastructureShared
-- Name: 85b3a4c470c9
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0, l_0_1 = bm.get_process_relationships()
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    if l_0_3.image_path ~= nil then
      local l_0_4 = mp.bitand(l_0_3.reason_ex, 1)
      if l_0_4 == 1 and (string.find(string.lower(l_0_3.image_path), "\\cmd.exe", 1, true) or string.find(string.lower(l_0_3.image_path), "\\powershell.exe", 1, true) or string.find(string.lower(l_0_3.image_path), "\\windows\\ltsvc\\", 1, true) or string.find(string.lower(l_0_3.image_path), "\\program files", 1, true)) then
        return mp.CLEAN
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
