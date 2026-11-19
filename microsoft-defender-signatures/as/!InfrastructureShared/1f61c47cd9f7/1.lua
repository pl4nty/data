-- Threat: !InfrastructureShared
-- Name: 1f61c47cd9f7
-- Type: 21

if mp.get_mpattribute("SIGATTR:FindPamesegWindow") then
  return mp.INFECTED
end
return mp.CLEAN
