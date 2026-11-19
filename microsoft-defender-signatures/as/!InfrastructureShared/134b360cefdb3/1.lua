-- Threat: !InfrastructureShared
-- Name: 134b360cefdb3
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, LuaFuncHelper

if is_excluded_parent_proc_auto() or IsSenseRelatedProc() == true then
  return mp.CLEAN
end
if IsProcNameInParentProcessTree("BM", {
  "csrss.exe",
  "aw.protectionagent.powershellexecutor64.exe",
  "vmware.hub.sfdagent.deploycmd.exe",
  "agentexecutor.exe",
  "pdzipservice.exe",
  "santivirusic.exe",
  "segurazoic.exe",
  "svservice.exe",
  "amagentassist.exe",
  "bdantiransomware.exe",
  "acrodist.exe"
}) then
  return mp.CLEAN
end
local l_0_0 = bm.get_imagepath()
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if string.find(l_0_0, "msmpeng", 1, true) or string.find(l_0_0, "nissrv", 1, true) or string.find(l_0_0, "mssense", 1, true) then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
if not l_0_1 or not next(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = this_sigattrlog[3].matched
local l_0_3 = this_sigattrlog[4].matched
local l_0_4 = this_sigattrlog[5].matched
local l_0_5 = {}
l_0_5.sig = "BruteRatel.MK!ems"
l_0_5.mapview = tostring(l_0_2 or false)
l_0_5.writevm = tostring(l_0_3 or false)
l_0_5.protect = tostring(l_0_4 or false)
if l_0_1.command_line then
  local l_0_6 = string.lower(l_0_1.command_line)
  l_0_5.cmd = l_0_6
  bm.add_related_string("[->] CMD: ", l_0_6, bm.RelatedStringBMReport)
  bm_AddRelatedFileFromCommandLine(l_0_6, nil, nil, 1)
end
if l_0_1.ppid then
  l_0_5.ppid = tostring(l_0_1.ppid)
end
bm.add_related_file(l_0_0)
bm.add_related_string("DetectionContext", safeJsonSerialize(l_0_5), bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1055", "module_stomping")
TrackPidAndTechniqueBM("BM", "T1106", "indirect_syscalls")
TrackPidAndTechniqueBM("BM", "T1562.001", "ntdll_unhooking")
TrackPidAndTechniqueBM("BM", "T1027", "xor_ssn_obfuscation")
if l_0_1.ppid then
  bm.request_SMS(l_0_1.ppid, "h+")
end
triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/BruteRatel.MK!ems")
add_parents()
return mp.INFECTED
