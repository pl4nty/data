-- Threat: !InfrastructureShared
-- Name: 4678d3a2d975
-- Type: 21

if mp.get_mpattribute("SIGATTR:GetSystemTimeBailout") then
  return mp.INFECTED
end
return mp.CLEAN
