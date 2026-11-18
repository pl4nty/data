-- Threat: !InfrastructureShared
-- Name: 9b8da119af69
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:AoboKeylogger.B")
  return mp.INFECTED
end
return mp.LOWFI
