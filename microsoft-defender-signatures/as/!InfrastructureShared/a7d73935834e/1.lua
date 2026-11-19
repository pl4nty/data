-- Threat: !InfrastructureShared
-- Name: a7d73935834e
-- Type: 21
-- Includes: TechniqueTracker

if not IsProcNameInParentProcessTree("CMDHSTR", {
  "picus.simulator.exe",
  "picus.agent.exe",
  "picus.simulation.agentservice.exe"
}, 5) then
  return mp.CLEAN
end
return mp.INFECTED
