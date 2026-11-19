-- Threat: !InfrastructureShared
-- Name: a6b398f6b60e
-- Type: 21
-- Includes: TechniqueTracker

if bm.GetSignatureMatchDuration() > 80000000 then
  return mp.CLEAN
end
if Has_NetworkLogonSuccess(true) then
  return mp.INFECTED
end
return mp.CLEAN
