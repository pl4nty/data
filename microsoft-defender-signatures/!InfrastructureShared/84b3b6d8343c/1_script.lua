-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b3b6d8343c\1_luac 

-- params : ...
-- function num : 0
if IsTaintedProcessinParentTreeForLinux("upx_file_created_taint") or IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") or IsTaintedProcessinParentTreeForLinux("masqueraded_file_extension_taint") then
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1074", "Collection_DataStaged_StagedArchiveExfil")
  TrackPidAndTechniqueBM("BM", "T1048", "Exfiltration_ExfiltrationOverAlternativeProtocol_StagedArchiveExfil")
  return mp.INFECTED
end
return mp.CLEAN

