-- Threat: !InfrastructureShared
-- Name: 1a1b3bf1f930e
-- Type: 21

if bm.GetSignatureMatchDuration() > 300000000 then
  return mp.CLEAN
end
return mp.INFECTED
