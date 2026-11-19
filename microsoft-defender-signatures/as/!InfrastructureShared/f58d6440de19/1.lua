-- Threat: !InfrastructureShared
-- Name: f58d6440de19
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:HistGrabber.G")
  return mp.INFECTED
end
return mp.LOWFI
