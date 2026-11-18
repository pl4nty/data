-- Threat: !InfrastructureShared
-- Name: 788d9960acee
-- Type: 21

if mp.HSTR_WEIGHT >= 7 then
  mp.set_mpattribute("PUA:Block:PerfectKeylogger")
  return mp.INFECTED
end
return mp.LOWFI
