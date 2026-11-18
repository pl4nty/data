-- Threat: !InfrastructureShared
-- Name: 4db3940f6ff3
-- Type: 21

if this_sigattrlog[1].matched or this_sigattrlog[2].matched then
  local l_0_0, l_0_1 = bm.get_process_relationships()
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    if l_0_3.image_path ~= nil then
      local l_0_4 = mp.bitand(l_0_3.reason_ex, 1)
      local l_0_5 = string.lower(l_0_3.image_path)
      if l_0_4 == 1 and (string.find(l_0_5, "\\cmd.exe", 1, true) or string.find(l_0_5, "\\powershell.exe", 1, true) or string.find(l_0_5, "\\powershell_ise.exe", 1, true) or string.find(l_0_5, "\\javaw.exe", 1, true) or string.find(l_0_5, "\\java.exe", 1, true) or string.find(l_0_5, "\\log-agent.exe", 1, true) or string.find(l_0_5, "\\ossec-agent.exe", 1, true)) then
        return mp.CLEAN
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
