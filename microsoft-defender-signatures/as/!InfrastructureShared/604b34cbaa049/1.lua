-- Threat: !InfrastructureShared
-- Name: 604b34cbaa049
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[1].matched or this_sigattrlog[2].matched or this_sigattrlog[3].matched or this_sigattrlog[4].matched or this_sigattrlog[5].matched or this_sigattrlog[6].matched or this_sigattrlog[7].matched or this_sigattrlog[8].matched or this_sigattrlog[9].matched or this_sigattrlog[10].matched or this_sigattrlog[11].matched or this_sigattrlog[12].matched or this_sigattrlog[13].matched or this_sigattrlog[14].matched or this_sigattrlog[15].matched or this_sigattrlog[16].matched or this_sigattrlog[17].matched or this_sigattrlog[18].matched or this_sigattrlog[19].matched or this_sigattrlog[20].matched or this_sigattrlog[22].matched or this_sigattrlog[23].matched or this_sigattrlog[24].matched then
  local l_0_0, l_0_1 = bm.get_process_relationships()
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    if l_0_3.image_path ~= nil then
      local l_0_4 = mp.bitand(l_0_3.reason_ex, 1)
      local l_0_5 = string.lower(l_0_3.image_path)
      if l_0_4 == 1 and (string.find(l_0_5, "\\sdiagnhost.exe", 1, true) or string.find(l_0_5, "\\qualysagent.exe", 1, true) or string.find(l_0_5, "\\pulsesecureservice.exe", 1, true) or string.find(l_0_5, "\\javaw.exe", 1, true) or string.find(l_0_5, "\\java.exe", 1, true) or string.find(l_0_5, "\\ruby.exe", 1, true) or string.find(l_0_5, "\\logmein.exe", 1, true) or string.find(l_0_5, "\\fasm.exe", 1, true) or string.find(l_0_5, ":\\windows\\assembly\\", 1, true) or string.find(l_0_5, "\\911 location manager.exe", 1, true)) then
        return mp.CLEAN
      end
      TrackPidAndTechniqueBM("BM", "T1047", "windows_management_instrumentation")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
