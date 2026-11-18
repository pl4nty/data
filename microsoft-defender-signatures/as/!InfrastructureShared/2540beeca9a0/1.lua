-- Threat: !InfrastructureShared
-- Name: 2540beeca9a0
-- Type: 21

if mp.get_mpattribute("SIGATTR:JS:eval") then
  return mp.INFECTED
end
return mp.CLEAN
