-- Threat: !InfrastructureShared
-- Name: 186d7964f43c4
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = GetRealPidForScenario("CMDHSTR")
if IsPidExcluded(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 ~= nil then
  local l_0_2 = string.lower(l_0_1.image_path)
  if 54 < #l_0_2 and l_0_2:find("microsoft.office.datacenter.torus.powershellworker.exe$") then
    return mp.CLEAN
  end
end
if IsDetectionThresholdMet(l_0_0) or IsTacticObservedForParents(l_0_0, "remoteservice-target", 3) or IsTacticObservedForParents(l_0_0, "exec_remotely_dropped_unsigned", 3) then
  return mp.INFECTED
end
if IsTacticObservedGlobal("susp_ransomware") then
  return mp.INFECTED
end
return mp.CLEAN
