-- Threat: Trojan:Script/SuspPsLaunch.C
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: Lua:CloudBlockLevelGT3 & MpIsWmiAMSIScan & SCPT:Trojan:JS/WmiCreateProc.C

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  if l_0_1:find("cscript", 1, true) or l_0_1:find("wscript", 1, true) then
    TrackPidAndTechnique("AMSI", "T1047", "WMIInstrumentation")
    return mp.INFECTED
  end
end
return mp.CLEAN
