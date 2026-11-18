-- Threat: !InfrastructureShared
-- Name: 5e8d225d98b1
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Genieo.AB")
  return mp.INFECTED
end
return mp.LOWFI
