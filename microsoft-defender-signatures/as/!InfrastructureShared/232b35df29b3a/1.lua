-- Threat: !InfrastructureShared
-- Name: 232b35df29b3a
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if is_excluded_parent_proc_auto() or IsSenseRelatedProc() == true or IsProcNameInParentProcessTree("BM", {
  "csrss.exe",
  "aw.protectionagent.powershellexecutor64.exe",
  "vmware.hub.sfdagent.deploycmd.exe"
}) then
  return mp.CLEAN
end
local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and next(l_0_0) and l_0_0.command_line then
  local l_0_1 = string.lower(l_0_0.command_line)
  bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
  bm.add_related_file(l_0_1)
  bm.add_related_string("[->] MALICIOUS SCRIPT: ", l_0_1, bm.RelatedStringBMReport)
end
TrackPidAndTechniqueBM("BM", "T1055", "Behavior:Win32/AMSI.Gracing.MK")
bm.add_action("SmsAsyncScanEvent", 5000)
bm.add_action("EmsScan", 1000)
add_parents()
return mp.INFECTED
