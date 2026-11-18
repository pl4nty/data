-- Threat: !InfrastructureShared
-- Name: 83d7a2ed8140
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 == nil or l_0_1.ppid == nil or l_0_1.image_path == nil then
  return mp.CLEAN
end
if IsPidExcluded(l_0_1.ppid) then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1.image_path)
if l_0_2:find("ltsvc.exe$") then
  return mp.CLEAN
end
local l_0_3 = l_0_2:match("([^\\]+)$")
local l_0_4 = {
  ["ccmexec.exe"] = true,
  ["gpscript.exe"] = true,
  ["mpcmdrun.exe"] = true,
  ["mssense.exe"] = true,
  ["senseir.exe"] = true
}
if l_0_4[l_0_3] then
  return mp.CLEAN
end
TrackPidAndTechnique(l_0_0, "T1003", "shadowcopy_access")
if IsDetectionThresholdMet(l_0_0) or IsDetectionThresholdMet(l_0_1.ppid) then
  return mp.INFECTED
end
local l_0_5 = GetTacticsTableForPid(l_0_1.ppid)
if l_0_5.winrshost_childproc or l_0_5.wsmprovhost_childproc or l_0_5.wmi_childproc or l_0_5.remotedropexe_childproc or l_0_5.python_childproc or l_0_5.rundll32_childproc or l_0_5.wscript_childproc or l_0_5.cscript_childproc or l_0_5.mshta_childproc or l_0_5.webshell_childproc or l_0_5.exec_remotedroppedscript_a then
  return mp.INFECTED
end
return mp.LOWFI
