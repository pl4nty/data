-- Threat: !InfrastructureShared
-- Name: 608d88506b29
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Genieo.H")
  return mp.INFECTED
end
return mp.LOWFI
