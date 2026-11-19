-- Threat: !InfrastructureShared
-- Name: 1088d8dff1fa9
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:PerfectKeylogger.A")
  return mp.INFECTED
end
return mp.LOWFI
