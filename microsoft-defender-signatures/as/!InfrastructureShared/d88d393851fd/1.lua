-- Threat: !InfrastructureShared
-- Name: d88d393851fd
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:KextLogger.A")
  return mp.INFECTED
end
return mp.LOWFI
