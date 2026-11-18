-- Threat: !InfrastructureShared
-- Name: 1048df0826c23
-- Type: 21

if mp.HSTR_WEIGHT >= 7 then
  mp.set_mpattribute("PUA:Block:HistGrabber.D")
  return mp.INFECTED
end
return mp.LOWFI
