-- Threat: !InfrastructureShared
-- Name: 1d8d7528f6e17
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("\\([^\\]+)$")
  local l_0_3 = {
    ["movere.bot4.local.exe"] = true,
    ["sqlagent.exe"] = true,
    ["acroinst2.exe"] = true,
    ["kagentsilent.exe"] = true,
    ["taddmwmi.exe"] = true,
    ["madservice.exe"] = true,
    ["ccmexec.exe"] = true,
    ["gpscript.exe"] = true,
    ["mpcmdrun.exe"] = true,
    ["mssense.exe"] = true,
    ["senseir.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
  local l_0_4 = GetRealPidForScenario("CMDHSTR")
  if IsPidExcluded(l_0_4) then
    return mp.CLEAN
  end
  if IsDetectionThresholdMet(l_0_4) and (IsTacticObservedForPid(l_0_4, "remoteservice-target") or IsTacticObservedForPid(l_0_4, "wmi_childproc") or IsTechniqueObservedForPid(l_0_4, "T1021.006")) then
    return mp.INFECTED
  end
end
return mp.CLEAN
