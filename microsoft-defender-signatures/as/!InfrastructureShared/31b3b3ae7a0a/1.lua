-- Threat: !InfrastructureShared
-- Name: 31b3b3ae7a0a
-- Type: 21

if this_sigattrlog[1].matched or this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0, l_0_1 = bm.get_process_relationships()
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    if l_0_3.image_path ~= nil then
      local l_0_4 = mp.bitand(l_0_3.reason_ex, 1)
      local l_0_5 = string.lower(l_0_3.image_path)
      if l_0_4 == 1 and (string.find(l_0_5, "\\cmd.exe", 1, true) or string.find(l_0_5, "\\powershell.exe", 1, true) or string.find(l_0_5, "\\powershell_ise.exe", 1, true)) then
        return mp.CLEAN
      end
      local l_0_6 = this_sigattrlog[1].utf8p2
      l_0_6 = string.lower(l_0_6)
      if string.find(l_0_6, ".owner -eq", 1, true) and string.find(l_0_6, ".processname -eq", 1, true) or string.find(l_0_6, "downloaddata", 1, true) and string.find(l_0_6, "start-process", 1, true) or string.find(l_0_6, "minidump", 1, true) and string.find(l_0_6, "$env:", 1, true) then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
