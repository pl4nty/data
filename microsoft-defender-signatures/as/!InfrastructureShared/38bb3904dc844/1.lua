-- Threat: !InfrastructureShared
-- Name: 38bb3904dc844
-- Type: 21

if this_sigattrlog[1].matched or this_sigattrlog[2].matched then
  local l_0_0, l_0_1 = bm.get_process_relationships()
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    if l_0_3.image_path ~= nil then
      local l_0_4 = mp.bitand(l_0_3.reason_ex, 1)
      local l_0_5 = string.lower(l_0_3.image_path)
      if l_0_5 == nil or 1 > string.len(l_0_5) then
        return mp.CLEAN
      end
      if l_0_4 == 1 and (string.find(l_0_5, "\\cmd.exe", 1, true) or string.find(l_0_5, "\\powershell.exe", 1, true) or string.find(l_0_5, "\\pwsh.exe", 1, true) or string.find(l_0_5, "\\powershell_ise.exe", 1, true) or string.find(l_0_5, "\\pangphip.exe", 1, true) or string.find(l_0_5, "\\log-agent.exe", 1, true) or string.find(l_0_5, "\\ossec-agent.exe", 1, true) or string.find(l_0_5, ":\\windows\\assembly\\", 1, true)) then
        return mp.CLEAN
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
