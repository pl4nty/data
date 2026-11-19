-- Threat: !InfrastructureShared
-- Name: 1038dc1a97502
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:AoboKeylogger.F")
  return mp.INFECTED
end
return mp.LOWFI
