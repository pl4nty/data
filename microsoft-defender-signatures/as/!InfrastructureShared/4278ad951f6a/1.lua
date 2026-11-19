-- Threat: !InfrastructureShared
-- Name: 4278ad951f6a
-- Type: 21

if mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.INFECTED
end
return mp.CLEAN
