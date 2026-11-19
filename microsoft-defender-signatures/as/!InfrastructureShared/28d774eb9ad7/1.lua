-- Threat: !InfrastructureShared
-- Name: 28d774eb9ad7
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = {
  ".sysmain.sdb"
}
if contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {
  "wscript.exe",
  "cscript.exe",
  "regsvr32.exe",
  "mshta.exe",
  "vbc.exe",
  "msbuild.exe",
  "wmic.exe",
  "cmstp.exe",
  "regasm.exe",
  "installutil.exe",
  "regsvcs.exe",
  "msxsl.exe",
  "xwizard.exe",
  "csc.exe",
  "winword.exe",
  "excel.exe",
  "powerpnt.exe",
  "cmd.exe",
  "powershell.exe",
  "pwsh.exe",
  "forfiles.exe"
}
local l_0_4 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_0)
if l_0_4 and next(l_0_4) and l_0_4.IntegrityLevel and l_0_4.IntegrityLevel >= MpCommon.SECURITY_MANDATORY_HIGH_RID and IsProcNameInParentProcessTree("CMDHSTR", l_0_3) then
  return mp.INFECTED
end
return mp.CLEAN
