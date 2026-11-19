-- Threat: !InfrastructureShared
-- Name: 99b344aecd8a
-- Type: 21

if bm.GetSignatureMatchDuration() > 720000000000 then
  return mp.CLEAN
end
return mp.INFECTED
