-- Threat: !InfrastructureShared
-- Name: 628dcaccadb9
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:PerfectKeylogger")
  return mp.INFECTED
end
return mp.LOWFI
