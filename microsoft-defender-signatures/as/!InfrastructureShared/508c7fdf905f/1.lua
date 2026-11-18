-- Threat: !InfrastructureShared
-- Name: 508c7fdf905f
-- Type: 21

if mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
return mp.INFECTED
