-- Threat: Trojan:PowerShell/MSIlAmsiTamperDetect.B
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: Lua:CloudBlockLevelGT3 & Lua:IsDotNetAMSIScan & (HSTR:DotNet/AmsiTampering.B | SLF:Trojan:PowerShell/MSILAmsiTamper.C | SLF:Trojan:PowerShell/MSILAmsiTamper.D) & Lua:TT:DetectionThresholdMet

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0:find("powershell", 1, true) then
  TrackPidAndTechnique("AMSI", "T1562.001", "amsitampering")
  return mp.INFECTED
end
return mp.CLEAN
