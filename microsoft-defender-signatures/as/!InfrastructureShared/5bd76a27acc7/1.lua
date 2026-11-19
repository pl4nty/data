-- Threat: !InfrastructureShared
-- Name: 5bd76a27acc7
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = GetRealPidForScenario("CMDHSTR")
  if IsPidExcluded(l_0_1) then
    return mp.CLEAN
  end
  local l_0_2 = l_0_0.image_path
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
  if IsDetectionThresholdMet(l_0_1) and (IsTacticObservedForPid(l_0_1, "remoteservice-target") or IsTacticObservedForPid(l_0_1, "wmi_childproc") or IsTechniqueObservedForPid(l_0_1, "T1021.006")) then
    return mp.INFECTED
  end
end
return mp.LOWFI
