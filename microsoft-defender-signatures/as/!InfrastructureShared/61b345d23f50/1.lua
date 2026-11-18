-- Threat: !InfrastructureShared
-- Name: 61b345d23f50
-- Type: 21

if bm.GetSignatureMatchDuration() > 30000000 then
  return mp.CLEAN
end
return mp.INFECTED
