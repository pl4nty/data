-- Threat: !InfrastructureShared
-- Name: 638d31c79a27
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Adload.E")
  return mp.INFECTED
end
return mp.LOWFI
