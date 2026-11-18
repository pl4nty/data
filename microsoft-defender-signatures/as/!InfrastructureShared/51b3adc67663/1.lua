-- Threat: !InfrastructureShared
-- Name: 51b3adc67663
-- Type: 21

if bm.GetSignatureMatchDuration() < 20000000 then
  return mp.INFECTED
end
return mp.CLEAN
