-- Threat: !InfrastructureShared
-- Name: 3161dc70447b
-- Type: 21

if mp.get_mpattribute("SIGATTR:Tireg.A") then
  return mp.INFECTED
end
return mp.CLEAN
