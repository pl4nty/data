-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\165b310e1b980\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
if (this_sigattrlog[3]).matched then
  TrackPidAndTechniqueBM("BM", "T1564.001", "DefenseEvasion_HideArtifacts_KandyKorn")
else
  TrackPidAndTechniqueBM("BM", "T1036.005", "DefenseEvasion_Masquerading_KandyKorn")
end
return mp.INFECTED

