-- Threat: !InfrastructureShared
-- Name: 968d0d14d9f2
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:AoboKeylogger.G")
  return mp.INFECTED
end
return mp.LOWFI
