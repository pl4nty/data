-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b33b45edd1\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 ~= nil and isTainted(l_0_0, "remote_file_chmodexec") then
  taint(l_0_0, "susp_remotefile_execution", 3600)
  TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer_SuspiciousRemoteFileExecution")
  TrackPidAndTechniqueBM("BM", "T1564", "DefenseEvasion_Hiddenfiles_SuspiciousRemoteFileExecution")
  addRelatedProcess()
  reportRelatedBmHits()
  local l_0_1, l_0_2 = (bm.get_process_relationships)()
  for l_0_6,l_0_7 in ipairs(l_0_2) do
    (bm.trigger_sig)("BmTraverseTreeBlock", "Detected", l_0_7.ppid)
  end
  if (sysio.IsFileExists)(l_0_0) then
    (bm.add_threat_file)(l_0_0)
  end
  return mp.INFECTED
end
do
  return mp.CLEAN
end

