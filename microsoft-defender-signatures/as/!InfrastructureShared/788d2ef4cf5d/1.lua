-- Threat: !InfrastructureShared
-- Name: 788d2ef4cf5d
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Shopsmart.C")
  return mp.INFECTED
end
return mp.LOWFI
