-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b0b3ab03aebc\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 == nil then
  return mp.CLEAN
end
taint(l_0_0, "mounted_file_execution", 3600)
addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1080", "LateralMovement_TaintSharedContent_RunningFromMnt")
return mp.INFECTED

