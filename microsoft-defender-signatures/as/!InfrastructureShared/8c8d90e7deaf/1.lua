-- Threat: !InfrastructureShared
-- Name: 8c8d90e7deaf
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Crossrider.D")
  return mp.INFECTED
end
return mp.LOWFI
