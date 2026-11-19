-- Threat: !InfrastructureShared
-- Name: 62be9f8b2256
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Utchi.A")
  return mp.INFECTED
end
return mp.LOWFI
