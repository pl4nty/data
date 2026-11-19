-- Threat: !InfrastructureShared
-- Name: 75404f98f125
-- Type: 21

if mp.get_mpattribute("SIGATTR:TouchAVdir") then
  return mp.INFECTED
end
return mp.CLEAN
