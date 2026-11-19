-- Threat: !InfrastructureShared
-- Name: 2fd71d5cc92c
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
local l_0_1, l_0_2 = pcall(mp.GetParentProcInfo)
if l_0_1 and l_0_2 ~= nil then
  l_0_0 = l_0_2.ppid
end
if l_0_0 ~= nil then
  if IsPidExcluded(l_0_0) then
    return mp.CLEAN
  end
  if IsTacticObservedForPid(l_0_0, "processinjection") then
    return mp.LOWFI
  end
end
local l_0_3 = mp.GetScannedPPID()
if l_0_3 ~= "" and l_0_3 ~= nil and IsTacticObservedForPid(l_0_3, "processinjection_target") then
  return mp.LOWFI
end
return mp.CLEAN
