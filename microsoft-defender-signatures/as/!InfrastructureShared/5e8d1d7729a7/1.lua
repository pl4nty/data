-- Threat: !InfrastructureShared
-- Name: 5e8d1d7729a7
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:MacFly.B")
  return mp.INFECTED
end
return mp.LOWFI
