-- Threat: !InfrastructureShared
-- Name: 83b3fcbefdff
-- Type: 21

if bm.GetSignatureMatchDuration() > 60000000 then
  return mp.CLEAN
end
return mp.INFECTED
