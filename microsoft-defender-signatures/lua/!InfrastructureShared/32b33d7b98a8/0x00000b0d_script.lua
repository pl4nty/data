-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b33d7b98a8\0x00000b0d_luac 

-- params : ...
-- function num : 0
if IsTaintedProcessinParentTreeForLinux("upx_file_created_taint") or IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") or IsTaintedProcessinParentTreeForLinux("masqueraded_file_extension_taint") or IsTaintedProcessinParentTreeForLinux("mounted_file_execution") then
  TrackPidAndTechniqueBM("BM", "T1570", "LateralMovement_LateralToolTransfer_SuspFileCreateFTP")
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN

