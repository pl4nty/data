-- Threat: !InfrastructureShared
-- Name: f6d7f47783bc
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = GetRealPidForScenario("CMDHSTR")
if IsPidExcluded(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 == nil or l_0_1.ppid == nil or l_0_1.image_path == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.image_path
local l_0_3 = string.lower(l_0_2:match("([^\\]+)$"))
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
local l_0_5 = mp.GetProcessCommandLine(l_0_1.ppid)
if l_0_5 == "" or l_0_5 == nil then
  return mp.CLEAN
end
l_0_5 = string.lower(l_0_5)
if l_0_5:find("\\nessus", 1, true) then
  return mp.CLEAN
end
local l_0_6 = GetTacticsTableForPid(l_0_1.ppid)
if l_0_6.winrshost_childproc or l_0_6.wsmprovhost_childproc or l_0_6.wmi_childproc or l_0_6.remotedropexe_childproc or l_0_6.python_childproc or l_0_6.rundll32_childproc or l_0_6.wscript_childproc or l_0_6.cscript_childproc or l_0_6.mshta_childproc or l_0_6.webshell_childproc or l_0_6.exec_remotedroppedscript_a then
  return mp.INFECTED
end
TrackPidAndTechnique(l_0_0, "T1003", "shadowcopy_access")
if IsDetectionThresholdMet(l_0_0) then
  return mp.INFECTED
end
return mp.LOWFI
