-- Threat: !InfrastructureShared
-- Name: 5f8deb1110a7
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Social2Search.A")
  return mp.INFECTED
end
return mp.LOWFI
