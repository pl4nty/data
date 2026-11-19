-- Threat: !InfrastructureShared
-- Name: d48dad88c998
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:AoboKeylogger.D")
  return mp.INFECTED
end
return mp.LOWFI
