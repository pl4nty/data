-- Threat: !InfrastructureShared
-- Name: 69b354475ec4
-- Type: 21

if bm.GetSignatureMatchDuration() > 10000000 then
  return mp.CLEAN
end
return mp.INFECTED
