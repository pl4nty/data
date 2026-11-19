-- Threat: !InfrastructureShared
-- Name: b1b3f4c6bcfc
-- Type: 21

if bm.GetSignatureMatchDuration() > 300000000 then
  return mp.CLEAN
end
return mp.INFECTED
