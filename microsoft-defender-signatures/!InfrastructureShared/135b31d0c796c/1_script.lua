-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\135b31d0c796c\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)()
if l_0_1 == nil or l_0_1.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_1.ppid, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_FileDeletion")
TrackPidAndTechniqueBM("BM", "T1485", "Impact_DataDestructionIntent")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

