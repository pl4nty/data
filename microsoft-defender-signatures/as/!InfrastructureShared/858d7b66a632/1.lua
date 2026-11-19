-- Threat: !InfrastructureShared
-- Name: 858d7b66a632
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:VSearch.C")
  return mp.INFECTED
end
return mp.LOWFI
