-- Threat: !InfrastructureShared
-- Name: 848d1eb4a732
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Adload.E")
  return mp.INFECTED
end
return mp.LOWFI
