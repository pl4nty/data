-- Threat: !InfrastructureShared
-- Name: 7d8d5b9953fa
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:RefogKeylogger.A")
  return mp.INFECTED
end
return mp.LOWFI
