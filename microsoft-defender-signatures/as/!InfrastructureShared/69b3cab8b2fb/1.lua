-- Threat: !InfrastructureShared
-- Name: 69b3cab8b2fb
-- Type: 21

if bm.GetSignatureMatchDuration() > 720000000000 then
  return mp.CLEAN
end
return mp.INFECTED
