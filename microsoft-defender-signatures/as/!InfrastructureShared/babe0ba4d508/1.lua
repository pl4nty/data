-- Threat: !InfrastructureShared
-- Name: babe0ba4d508
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Ewind.C")
  return mp.INFECTED
end
return mp.LOWFI
