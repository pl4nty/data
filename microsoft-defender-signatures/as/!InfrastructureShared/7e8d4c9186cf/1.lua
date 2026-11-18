-- Threat: !InfrastructureShared
-- Name: 7e8d4c9186cf
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:KextLogger.D")
  return mp.INFECTED
end
return mp.LOWFI
