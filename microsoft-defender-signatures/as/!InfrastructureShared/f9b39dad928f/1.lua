-- Threat: !InfrastructureShared
-- Name: f9b39dad928f
-- Type: 21

if bm.GetSignatureMatchDuration() > 30000000 then
  return mp.CLEAN
end
return mp.INFECTED
