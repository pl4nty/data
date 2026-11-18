-- Threat: !InfrastructureShared
-- Name: e2b31b07da3b
-- Type: 21

if bm.GetSignatureMatchDuration() > 30000000 then
  return mp.CLEAN
end
return mp.INFECTED
