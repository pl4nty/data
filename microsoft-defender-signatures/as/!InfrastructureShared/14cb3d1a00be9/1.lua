-- Threat: !InfrastructureShared
-- Name: 14cb3d1a00be9
-- Type: 21
-- Includes: TechniqueTracker

if bm.GetSignatureMatchDuration() > 200000000 then
  return mp.CLEAN
end
Has_NetworkLogonSuccess(true)
return mp.INFECTED
