-- Threat: !InfrastructureShared
-- Name: 69b382379ec4
-- Type: 21

if bm.GetSignatureMatchDuration() > 720000000000 then
  return mp.CLEAN
end
return mp.INFECTED
