-- Threat: !InfrastructureShared
-- Name: 6b8dffe5310b
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Kidlogger.C")
  return mp.INFECTED
end
return mp.LOWFI
