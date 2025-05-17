-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7db3a08f754d\1.luac 

-- params : ...
-- function num : 0
if IsTaintedProcessinParentTreeForLinux("upx_file_created_taint") or IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") or IsTaintedProcessinParentTreeForLinux("masqueraded_file_extension_taint") then
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1074", "Collection_DataStaged_StagedSensitiveFile")
  return mp.INFECTED
end
return mp.CLEAN

