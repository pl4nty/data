-- Threat: !InfrastructureShared
-- Name: d18d023f4d73
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("PUA:Block:AoboKeylogger.C")
  return mp.INFECTED
end
return mp.LOWFI
