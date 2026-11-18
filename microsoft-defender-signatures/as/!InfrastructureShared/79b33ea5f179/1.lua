-- Threat: !InfrastructureShared
-- Name: 79b33ea5f179
-- Type: 21

if bm.GetSignatureMatchDuration() > 300000000 then
  return mp.CLEAN
end
return mp.INFECTED
