-- Threat: !InfrastructureShared
-- Name: 898de48d8a35
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:HistGrabber.B")
  return mp.INFECTED
end
return mp.LOWFI
