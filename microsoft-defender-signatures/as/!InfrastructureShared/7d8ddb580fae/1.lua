-- Threat: !InfrastructureShared
-- Name: 7d8ddb580fae
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Adload.G")
  return mp.INFECTED
end
return mp.LOWFI
