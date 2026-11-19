-- Threat: !InfrastructureShared
-- Name: b1bef13e6257
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:AndroidArmour.A")
  return mp.INFECTED
end
return mp.LOWFI
