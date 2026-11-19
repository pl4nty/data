-- Threat: !InfrastructureShared
-- Name: 45408bb8b6eb
-- Type: 21

if mp.get_mpattribute("SIGATTR:ASEP") then
  return mp.INFECTED
end
return mp.LOWFI
