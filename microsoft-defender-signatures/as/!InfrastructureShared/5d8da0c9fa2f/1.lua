-- Threat: !InfrastructureShared
-- Name: 5d8da0c9fa2f
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Genieo.J")
  return mp.INFECTED
end
return mp.LOWFI
