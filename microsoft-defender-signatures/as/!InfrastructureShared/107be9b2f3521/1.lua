-- Threat: !InfrastructureShared
-- Name: 107be9b2f3521
-- Type: 21

if mp.HSTR_WEIGHT >= 8 then
  mp.set_mpattribute("PUA:Block:Wapsx.B")
  return mp.INFECTED
end
return mp.LOWFI
