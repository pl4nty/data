-- Threat: !InfrastructureShared
-- Name: 698d6cdf2af5
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Kidlogger.D")
  return mp.INFECTED
end
return mp.LOWFI
