-- Threat: !InfrastructureShared
-- Name: 6d8d70d02eb8
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:PerfectKeyLogger.D")
  return mp.INFECTED
end
return mp.LOWFI
