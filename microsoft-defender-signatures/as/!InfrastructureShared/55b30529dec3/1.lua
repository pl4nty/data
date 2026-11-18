-- Threat: !InfrastructureShared
-- Name: 55b30529dec3
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if l_0_0 and (string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\windows", 1, true)) then
  local l_0_1 = MpCommon.QueryPersistContext(l_0_0, "NewPECreatedNoCert")
  if l_0_1 then
    local l_0_2 = GetTaintLevelHR()
    if l_0_2 == nil or l_0_2 ~= "Medium" and l_0_2 ~= "High" then
      return mp.CLEAN
    end
    if IsDetectionThresholdMet("BM") and (IsTacticObservedForPid("BM", "processinjection_target") or IsTacticObservedForPid("BM", "discovery")) then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
local l_0_3 = MpCommon.QueryPersistContext(l_0_0, "ExecutedPENoCert")
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = GetTaintLevelHR()
if l_0_4 == nil or l_0_4 ~= "Medium" and l_0_4 ~= "High" then
  return mp.CLEAN
end
if IsDetectionThresholdMet("BM") and (IsTacticObservedForPid("BM", "processinjection_target") or IsTacticObservedForPid("BM", "discovery")) then
  return mp.INFECTED
end
return mp.CLEAN
