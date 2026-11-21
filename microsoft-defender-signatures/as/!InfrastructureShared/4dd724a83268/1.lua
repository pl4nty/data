-- Threat: !InfrastructureShared
-- Name: 4dd724a83268
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = versioning.GetOrgID()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if l_0_0 ~= "9ee8ddb9-e98f-4b86-a160-fe3b96f39cc6" and versioning.IsSampled(100, false, true, true) == false then
  return mp.CLEAN
end
if not IsProcNameInParentProcessTree("CMDHSTR", {
  "picus.simulator.exe",
  "picus.agent.exe",
  "picus.simulation.agentservice.exe"
}, 5) then
  return mp.CLEAN
end
return mp.INFECTED
