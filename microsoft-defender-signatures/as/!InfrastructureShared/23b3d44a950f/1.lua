-- Threat: !InfrastructureShared
-- Name: 23b3d44a950f
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0, l_0_1 = bm.get_process_relationships()
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    if l_0_3.image_path ~= nil then
      local l_0_4 = string.lower(l_0_3.image_path)
      local l_0_5 = mp.bitand(l_0_3.reason_ex, 1)
      if l_0_5 == 1 and (string.find(l_0_4, "\\cmd.exe", 1, true) or string.find(l_0_4, "\\powershell.exe", 1, true) or string.find(l_0_4, "\\sdiagnhost.exe", 1, true) or string.find(l_0_4, "\\qualysagent.exe", 1, true) or string.find(l_0_4, "\\pulsesecureservice.exe", 1, true) or string.find(l_0_4, "\\javaw.exe", 1, true) or string.find(l_0_4, "\\java.exe", 1, true) or string.find(l_0_4, "\\ruby.exe", 1, true) or string.find(l_0_4, "\\logmein.exe", 1, true) or string.find(l_0_4, "\\fasm.exe", 1, true) or string.find(l_0_4, ":\\windows\\assembly\\", 1, true) or string.find(l_0_4, "\\911 location manager.exe", 1, true)) then
        return mp.CLEAN
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
