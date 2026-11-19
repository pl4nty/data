-- Threat: !InfrastructureShared
-- Name: 159b3e9f147bb
-- Type: 21
-- Includes: TechniqueTracker

if bm.GetSignatureMatchDuration() > 80000000 then
  return mp.CLEAN
end
if Has_NetworkLogonSuccess(true) then
  return mp.INFECTED
end
return mp.CLEAN
