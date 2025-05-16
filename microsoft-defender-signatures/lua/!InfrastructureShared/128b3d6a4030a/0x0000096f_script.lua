-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\128b3d6a4030a\0x0000096f_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if not isParentPackageManager(l_0_0.ppid, true) and IsDetectionThresholdMetLinux(l_0_0.ppid) then
  AddResearchData("BM", true)
  reportRelatedBmHits()
  addRelatedProcess()
  return mp.INFECTED
end
return mp.CLEAN

