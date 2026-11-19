-- Threat: !InfrastructureShared
-- Name: 558d0f46b7dc
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Genieo.D")
  return mp.INFECTED
end
return mp.LOWFI
