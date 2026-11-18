-- Threat: !InfrastructureShared
-- Name: 7d8dd30aef2b
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:MacBooster")
  return mp.INFECTED
end
return mp.LOWFI
