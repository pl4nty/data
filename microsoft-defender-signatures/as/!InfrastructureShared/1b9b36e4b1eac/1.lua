-- Threat: !InfrastructureShared
-- Name: 1b9b36e4b1eac
-- Type: 21

if bm.GetSignatureMatchDuration() > 600000000 then
  return mp.CLEAN
end
return mp.INFECTED
