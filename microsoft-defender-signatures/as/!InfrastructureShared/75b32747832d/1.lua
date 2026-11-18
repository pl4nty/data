-- Threat: !InfrastructureShared
-- Name: 75b32747832d
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = pcall(bm.get_current_process_startup_info)
if l_0_0 and l_0_1 ~= nil then
  local l_0_2 = l_0_1.ppid
  if l_0_2 ~= nil and IsTechniqueObservedForPid(l_0_2, "T1027.002") then
    TrackPidAndTechniqueBM("BM", "T1059", "commandscriptpacked")
    local l_0_3, l_0_4 = bm.get_process_relationships()
    local l_0_5
    for l_0_6, l_0_7 in ipairs(l_0_4) do
      local l_0_8 = mp.bitand(l_0_7.reason_ex, 1)
      if l_0_8 == 1 and (string.find(string.lower(l_0_7.image_path), "\\cmd.exe\\", 1, true) or string.find(string.lower(l_0_7.image_path), "\\powershell.exe\\", 1, true) or string.find(string.lower(l_0_7.image_path), "\\wscript.exe\\", 1, true) or string.find(string.lower(l_0_7.image_path), "\\cscript.exe\\", 1, true) or string.find(string.lower(l_0_7.image_path), "\\mshta.exe\\", 1, true)) then
        l_0_5 = l_0_7.ppid
        TrackPidAndTechniqueBM(l_0_5, "T1059", "commandscriptpacked")
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
