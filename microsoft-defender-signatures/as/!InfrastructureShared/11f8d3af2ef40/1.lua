-- Threat: !InfrastructureShared
-- Name: 11f8d3af2ef40
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Adload.EC")
  return mp.INFECTED
end
return mp.LOWFI
