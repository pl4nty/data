-- Threat: !InfrastructureShared
-- Name: a1be64886fb2
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:SheriDroid.B")
  return mp.INFECTED
end
return mp.LOWFI
