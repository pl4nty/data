-- Threat: !InfrastructureShared
-- Name: 928d807a9837
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("PUA:Block:Genieo.B")
  return mp.INFECTED
end
return mp.LOWFI
