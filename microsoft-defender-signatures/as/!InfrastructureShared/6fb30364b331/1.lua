-- Threat: !InfrastructureShared
-- Name: 6fb30364b331
-- Type: 21

if bm.GetSignatureMatchDuration() > 720000000000 then
  return mp.CLEAN
end
return mp.INFECTED
