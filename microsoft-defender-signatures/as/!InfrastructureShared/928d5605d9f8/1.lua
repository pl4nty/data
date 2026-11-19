-- Threat: !InfrastructureShared
-- Name: 928d5605d9f8
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Adload.I")
  return mp.INFECTED
end
return mp.LOWFI
