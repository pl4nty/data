-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1bbb3e2bbd7ae\0x00000b13_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 ~= nil and l_0_0 ~= "" and (IsTaintedProcessinParentTreeForLinux("upx_file_created_taint") or IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") or IsTaintedProcessinParentTreeForLinux("masqueraded_file_extension_taint") or IsTaintedProcessinParentTreeForLinux("mounted_file_execution")) then
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption_urandom")
  return mp.INFECTED
end
return mp.CLEAN

